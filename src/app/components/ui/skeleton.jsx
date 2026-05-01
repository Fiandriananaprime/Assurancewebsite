import { cn } from "./utils";
import { cva } from "class-variance-authority";

const skeletonVariants = cva(
  "overflow-hidden bg-accent relative before:absolute before:inset-0 before:bg-gradient-to-r before:from-transparent before:via-white/30 before:to-transparent before:opacity-60 before:pointer-events-none animate-shimmer",
  {
    variants: {
      variant: {
        rectangular: "rounded-md",
        circle: "rounded-full",
        text: "rounded h-4 w-full",
      },
    },
    defaultVariants: {
      variant: "rectangular",
    },
  }
);

function Skeleton({ className, variant, ...props }) {
  return (
    <div
      data-slot="skeleton"
      role="status"
      aria-hidden="true"
      className={cn(skeletonVariants({ variant, className }))}
      {...props}
    />
  );
}

export { Skeleton };