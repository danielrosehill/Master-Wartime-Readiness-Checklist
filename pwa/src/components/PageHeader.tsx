export function PageHeader({
  title,
  subtitle,
  color,
  icon,
}: {
  title: string
  subtitle?: string
  color?: string
  icon?: React.ReactNode
}) {
  return (
    <div className="mb-6">
      <div className="flex items-center gap-3">
        {icon && <div className="text-2xl">{icon}</div>}
        <h1 className="text-xl font-bold text-slate-100" style={color ? { color } : undefined}>
          {title}
        </h1>
      </div>
      {subtitle && <p className="text-sm text-slate-400 mt-1 ml-0">{subtitle}</p>}
    </div>
  )
}
