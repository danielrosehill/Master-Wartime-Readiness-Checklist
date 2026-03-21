import { useState } from 'react'
import { PageHeader } from '../components/PageHeader'
import { Collapsible } from '../components/Collapsible'
import { guidanceSections } from '../data/guidance'

function renderText(text: string) {
  // Simple bold markdown rendering
  const parts = text.split(/(\*\*[^*]+\*\*)/)
  return parts.map((part, i) => {
    if (part.startsWith('**') && part.endsWith('**')) {
      return <strong key={i} className="text-slate-200">{part.slice(2, -2)}</strong>
    }
    return <span key={i}>{part}</span>
  })
}

export function GuidanceNotes() {
  const [search, setSearch] = useState('')
  const filtered = search.trim()
    ? guidanceSections.filter(
        (s) =>
          s.title.toLowerCase().includes(search.toLowerCase()) ||
          s.content.some((c) => c.toLowerCase().includes(search.toLowerCase())),
      )
    : guidanceSections

  return (
    <div>
      <PageHeader
        title="Guidance Notes"
        subtitle="Read once, then reference as needed."
        color="#2980b9"
      />

      <input
        type="search"
        placeholder="Search guidance..."
        value={search}
        onChange={(e) => setSearch(e.target.value)}
        className="w-full px-4 py-2.5 rounded-xl bg-slate-800/80 border border-slate-700/50 text-slate-200 placeholder-slate-500 text-sm mb-4 outline-none focus:border-blue-600/50"
      />

      <div className="space-y-3">
        {filtered.map((section) => (
          <Collapsible key={section.id} title={section.title} color={section.color}>
            <div className="space-y-3">
              {section.content.map((paragraph, i) => (
                <p key={i} className="text-sm text-slate-300 leading-relaxed">
                  {renderText(paragraph)}
                </p>
              ))}
            </div>
          </Collapsible>
        ))}
        {filtered.length === 0 && (
          <p className="text-center text-slate-500 py-8">No matching guidance found.</p>
        )}
      </div>
    </div>
  )
}
