import { useState } from 'react'

export function Collapsible({
  title,
  color,
  badge,
  children,
  defaultOpen = false,
}: {
  title: string
  color?: string
  badge?: React.ReactNode
  children: React.ReactNode
  defaultOpen?: boolean
}) {
  const [open, setOpen] = useState(defaultOpen)

  return (
    <div className="border border-slate-700/50 rounded-xl overflow-hidden">
      <button
        type="button"
        onClick={() => setOpen(!open)}
        className="w-full flex items-center justify-between p-4 text-left bg-slate-800/50 active:bg-slate-700/50"
      >
        <div className="flex items-center gap-3 flex-1 min-w-0">
          {color && <div className="w-1 h-6 rounded-full flex-shrink-0" style={{ backgroundColor: color }} />}
          <span className="font-semibold text-slate-100 truncate">{title}</span>
          {badge}
        </div>
        <svg
          className={`w-5 h-5 text-slate-400 flex-shrink-0 transition-transform ${open ? 'rotate-180' : ''}`}
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
          strokeWidth={2}
        >
          <path strokeLinecap="round" strokeLinejoin="round" d="M19 9l-7 7-7-7" />
        </svg>
      </button>
      {open && <div className="p-4 border-t border-slate-700/30">{children}</div>}
    </div>
  )
}
