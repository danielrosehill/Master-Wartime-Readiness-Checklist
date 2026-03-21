import { useState } from 'react'
import { PageHeader } from '../components/PageHeader'
import { Collapsible } from '../components/Collapsible'
import { ChecklistView } from '../components/ChecklistView'
import {
  emergencyNumbers,
  supportNumbers,
  glossary,
  radioStations,
  type EmergencyNumber,
} from '../data/emergency'
import { hfcAppChecklist, mamadChecklist, homeSafetyChecklist, pantryCategories, pantryNotes } from '../data/checklists'

function PhoneButton({ entry }: { entry: EmergencyNumber }) {
  const dialNumber = entry.number.replace('*', '%23')
  return (
    <div className="flex items-center justify-between p-3 rounded-lg bg-slate-800/50 border border-slate-700/30">
      <div className="flex-1 min-w-0">
        <div className="flex items-center gap-2">
          <span className="font-bold text-lg text-slate-100 font-mono">{entry.number}</span>
          <span className="text-sm font-medium text-slate-300">{entry.service}</span>
        </div>
        <p className="text-xs text-slate-400 mt-0.5">{entry.notes}</p>
        {entry.sms && <p className="text-xs text-slate-500 mt-0.5">SMS: {entry.sms}</p>}
      </div>
      <a
        href={`tel:${dialNumber}`}
        className="flex-shrink-0 ml-3 w-10 h-10 rounded-full bg-green-700 flex items-center justify-center active:bg-green-600"
        aria-label={`Call ${entry.service}`}
      >
        <svg className="w-5 h-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"
          />
        </svg>
      </a>
    </div>
  )
}

export function Emergency({ onNavigate }: { onNavigate: (page: string) => void }) {
  const [glossarySearch, setGlossarySearch] = useState('')

  const filteredGlossary = glossarySearch.trim()
    ? glossary.filter(
        (g) =>
          g.hebrew.includes(glossarySearch) ||
          g.transliteration.toLowerCase().includes(glossarySearch.toLowerCase()) ||
          g.meaning.toLowerCase().includes(glossarySearch.toLowerCase()),
      )
    : glossary

  return (
    <div>
      <PageHeader
        title="Emergency Information"
        subtitle="Numbers, references, and appendices."
        color="#8e44ad"
      />

      <div className="space-y-3">
        {/* Emergency Numbers */}
        <Collapsible title="Emergency Numbers" color="#c0392b" defaultOpen>
          <div className="space-y-2">
            {emergencyNumbers.map((entry) => (
              <PhoneButton key={entry.number} entry={entry} />
            ))}
          </div>
        </Collapsible>

        {/* Support Numbers */}
        <Collapsible title="Support & Welfare" color="#27774e">
          <div className="space-y-2">
            {supportNumbers.map((entry) => (
              <PhoneButton key={entry.number} entry={entry} />
            ))}
          </div>
        </Collapsible>

        {/* Decision Tree */}
        <button
          type="button"
          onClick={() => onNavigate('decision-tree')}
          className="w-full p-4 rounded-xl bg-red-950/30 border border-red-800/40 text-left active:scale-[0.98] transition-all"
        >
          <div className="flex items-center gap-3">
            <span className="text-xl">&#128680;</span>
            <div>
              <div className="font-semibold text-red-300">Protected Space Decision Tree</div>
              <div className="text-xs text-slate-400">Siren response — where to go</div>
            </div>
            <svg className="w-5 h-5 text-slate-500 ml-auto" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M9 5l7 7-7 7" />
            </svg>
          </div>
        </button>

        {/* Hebrew Glossary */}
        <Collapsible title="Hebrew Glossary" color="#2563a0">
          <input
            type="search"
            placeholder="Search terms..."
            value={glossarySearch}
            onChange={(e) => setGlossarySearch(e.target.value)}
            className="w-full px-3 py-2 rounded-lg bg-slate-800/80 border border-slate-700/50 text-slate-200 placeholder-slate-500 text-sm mb-3 outline-none"
          />
          <div className="space-y-2">
            {filteredGlossary.map((entry) => (
              <div key={entry.transliteration} className="p-2.5 rounded-lg bg-slate-800/30 border border-slate-700/20">
                <div className="flex items-center justify-between">
                  <span className="text-lg font-medium text-slate-200" dir="rtl">{entry.hebrew}</span>
                  <span className="text-sm font-semibold text-blue-300">{entry.transliteration}</span>
                </div>
                <p className="text-sm text-slate-400 mt-0.5">{entry.meaning}</p>
              </div>
            ))}
          </div>
        </Collapsible>

        {/* Radio Frequencies */}
        <Collapsible title="Emergency Radio Frequencies" color="#d35400">
          <div className="bg-amber-950/30 border border-amber-800/30 rounded-lg p-3 mb-3 space-y-1.5">
            <p className="text-sm text-amber-300">AM is more reliable during emergencies — longer range, works inside buildings better than FM.</p>
            <p className="text-xs text-amber-400/70">FM frequencies vary by region. The frequencies above are approximate; scan nearby if no signal.</p>
            <p className="text-xs text-amber-400/70">During emergencies, all stations simulcast HFC announcements.</p>
          </div>
          <div className="space-y-2">
            {radioStations.map((station) => (
              <div key={station.station} className="p-3 rounded-lg bg-slate-800/30 border border-slate-700/20">
                <div className="font-medium text-slate-200 text-sm">{station.station}</div>
                <div className="flex gap-4 mt-1">
                  <span className="text-xs text-slate-400">FM: {station.fm}</span>
                  <span className="text-xs text-slate-400">AM: {station.am}</span>
                </div>
                <p className="text-xs text-slate-500 mt-0.5">{station.notes}</p>
              </div>
            ))}
          </div>
          <p className="text-xs text-slate-500 mt-3 italic">
            Write your local frequencies on the radio itself with a permanent marker.
          </p>
        </Collapsible>

        {/* HFC App Config */}
        <Collapsible title="HFC App Configuration" color="#2563a0">
          <ChecklistView section={hfcAppChecklist} />
        </Collapsible>

        {/* Mamad Inspection */}
        <Collapsible title="Mamad Inspection" color="#2563a0">
          <ChecklistView section={mamadChecklist} />
        </Collapsible>

        {/* Pre-Emergency Home Safety */}
        <Collapsible title="Pre-Emergency Home Safety" color="#2563a0">
          <ChecklistView section={homeSafetyChecklist} />
        </Collapsible>

        {/* Emergency Pantry Staples */}
        <Collapsible title="Emergency Pantry Staples (Israel)" color="#27774e">
          <div className="space-y-3">
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-slate-700/50">
                    <th className="text-left py-2 px-2 text-slate-400 font-medium">Category</th>
                    <th className="text-left py-2 px-2 text-slate-400 font-medium">Items</th>
                    <th className="text-left py-2 px-2 text-slate-400 font-medium whitespace-nowrap">Shelf Life</th>
                  </tr>
                </thead>
                <tbody>
                  {pantryCategories.map((cat) => (
                    <tr key={cat.category} className="border-b border-slate-800/50">
                      <td className="py-2 px-2 text-slate-200 font-medium whitespace-nowrap">{cat.category}</td>
                      <td className="py-2 px-2 text-slate-300 text-xs">{cat.items}</td>
                      <td className="py-2 px-2 text-slate-400 text-xs whitespace-nowrap">{cat.shelfLife}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
            <div className="bg-emerald-950/30 border border-emerald-800/30 rounded-lg p-3 space-y-1.5">
              {pantryNotes.map((note, i) => (
                <p key={i} className="text-xs text-emerald-300/80">{note}</p>
              ))}
            </div>
          </div>
        </Collapsible>
      </div>
    </div>
  )
}
