import React, { useEffect } from 'react';

export function Toast({ id, message, type = 'info', duration = 4000, onClose }) {
  useEffect(() => {
    const t = setTimeout(() => onClose && onClose(id), duration);
    return () => clearTimeout(t);
  }, [id, duration, onClose]);

  const bg = type === 'error' ? 'bg-destructive text-white' : type === 'success' ? 'bg-primary text-white' : 'bg-secondary text-secondary-foreground';

  return (
    <div role="status" aria-live="polite" className={`max-w-sm w-full ${bg} rounded-md p-3 shadow-lg elevated ripple`}>
      <div className="text-sm">{message}</div>
    </div>
  );
}

export default Toast;
