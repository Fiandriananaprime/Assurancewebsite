import React, { useState, useCallback } from 'react';
import Toast from './toast';

export function useToast() {
  const [toasts, setToasts] = useState([]);
  const push = useCallback((message, opts = {}) => {
    const id = Math.random().toString(36).slice(2, 9);
    setToasts(t => [...t, { id, message, ...opts }]);
    return id;
  }, []);
  const remove = useCallback((id) => setToasts(t => t.filter(x => x.id !== id)), []);
  return { toasts, push, remove };
}

export function ToastManager({ manager }) {
  if (!manager) return null;
  return (
    <div className="fixed right-6 top-6 z-50 flex flex-col gap-3">
      {manager.toasts.map(t => (
        <Toast key={t.id} id={t.id} message={t.message} type={t.type} duration={t.duration} onClose={manager.remove} />
      ))}
    </div>
  );
}

export default ToastManager;
