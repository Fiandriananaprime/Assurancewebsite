import { useEffect, useState } from "react";
import { AUTH_USER_UPDATED_EVENT, getAuthUser } from "../auth";

export function useAuthUser() {
  const [authUser, setAuthUser] = useState(() => getAuthUser());

  useEffect(() => {
    const syncAuthUser = () => {
      setAuthUser(getAuthUser());
    };

    const syncFromEvent = (event) => {
      if (event?.detail === undefined) {
        syncAuthUser();
        return;
      }

      setAuthUser(event.detail);
    };

    window.addEventListener("storage", syncAuthUser);
    window.addEventListener(AUTH_USER_UPDATED_EVENT, syncFromEvent);

    return () => {
      window.removeEventListener("storage", syncAuthUser);
      window.removeEventListener(AUTH_USER_UPDATED_EVENT, syncFromEvent);
    };
  }, []);

  return authUser;
}
