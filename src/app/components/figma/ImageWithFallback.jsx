import React, { useEffect, useState } from 'react';

const ERROR_IMG_SRC = 'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iODgiIGhlaWdodD0iODgiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgc3Ryb2tlPSIjMDAwIiBzdHJva2UtbGluZWpvaW49InJvdW5kIiBvcGFjaXR5PSIuMyIgZmlsbD0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIzLjciPjxyZWN0IHg9IjE2IiB5PSIxNiIgd2lkdGg9IjU2IiBoZWlnaHQ9IjU2IiByeD0iNiIvPjxwYXRoIGQ9Im0xNiA1OCAxNi0xOCAzMiAzMiIvPjxjaXJjbGUgY3g9IjUzIiBjeT0iMzUiIHI9IjciLz48L3N2Zz4KCg==';

export function ImageWithFallback(props) {
  let { src, alt, style, className, ...rest } = props;
  const [didError, setDidError] = useState(false);
  const [currentSrc, setCurrentSrc] = useState(src);
  const [triedAbsolute, setTriedAbsolute] = useState(false);

  useEffect(() => {
    setDidError(false);
    setTriedAbsolute(false);
    // normalize src when it's an object (e.g., { url: '...' } or { profileImage: '...' })
    try {
      if (src && typeof src === 'object') {
        // try common string fields
        const s = src.url || src.src || src.profileImage || src.profile_image_url || src.image || src.path || '';
        setCurrentSrc(s);
      } else {
        setCurrentSrc(src);
      }
    } catch (e) {
      setCurrentSrc(src);
    }
  }, [src]);

  const getAbsoluteIfNeeded = (s) => {
    try {
      if (typeof s !== 'string') return s;
      let viteApi;
      try {
        viteApi = import.meta && import.meta.env && import.meta.env.VITE_API_URL;
      } catch (e) {
        viteApi = undefined;
      }
      // If s is absolute and points to the API host, convert it to a relative path so the dev proxy handles it
      if (s.startsWith('http://') || s.startsWith('https://')) {
        try {
          const url = new URL(s);
          if (viteApi) {
            try {
              const base = new URL(String(viteApi)).origin;
              if (url.origin === base) return url.pathname + (url.search || '');
            } catch (e) {}
          }
          if (url.hostname === 'localhost' && (url.port === '5000' || url.port === '3000')) {
            return url.pathname + (url.search || '');
          }
        } catch (e) {
          // fall through
        }
        return s;
      }

      // Only prepend VITE_API_URL when it's explicitly set; otherwise leave relative paths
      if (s.startsWith('/') && s.includes('uploads') && viteApi) {
        const base = String(viteApi).replace(/\/$/, '');
        return `${base}${s}`;
      }
      return s;
    } catch (e) {
      return s;
    }
  };

  const handleError = () => {
    // If the source looks like a backend uploads path and we haven't tried absolute URL yet,
    // try prepending VITE_API_URL and retry once.
    if (!triedAbsolute && typeof currentSrc === 'string' && currentSrc.startsWith('/') && currentSrc.includes('uploads')) {
      const abs = getAbsoluteIfNeeded(currentSrc);
      if (abs && abs !== currentSrc) {
        setCurrentSrc(abs);
        setTriedAbsolute(true);
        return;
      }
    }

    setDidError(true);
  };

  if (didError) {
    return (
      <div className={`inline-block bg-gray-100 text-center align-middle ${className ?? ''}`} style={style}>
        <div className="flex items-center justify-center w-full h-full">
          <img src={ERROR_IMG_SRC} alt="Error loading image" {...rest} data-original-url={String(src)} />
        </div>
      </div>
    );
  }

  const finalSrc = getAbsoluteIfNeeded(currentSrc);

  // if finalSrc is falsy, render fallback svg placeholder
  if (!finalSrc) {
    return (
      <div className={`inline-block bg-gray-100 text-center align-middle ${className ?? ''}`} style={style}>
        <div className="flex items-center justify-center w-full h-full">
          <img src={ERROR_IMG_SRC} alt={alt || 'avatar'} {...rest} />
        </div>
      </div>
    );
  }

  return <img src={finalSrc} alt={alt} className={className} style={style} {...rest} onError={handleError} />;
}