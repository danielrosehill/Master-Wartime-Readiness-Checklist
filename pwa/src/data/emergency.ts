export interface EmergencyNumber {
  number: string
  service: string
  notes: string
  sms?: string
}

export const emergencyNumbers: EmergencyNumber[] = [
  { number: '100', service: 'Israel Police', notes: 'Unexploded ordnance, security incidents, terror events', sms: '052-2020100' },
  { number: '101', service: 'Magen David Adom (MDA)', notes: 'Injuries, first aid, medical emergencies', sms: '052-7000101' },
  { number: '102', service: 'Fire & Rescue', notes: 'Fires, trapped persons, structural collapse', sms: '050-5960735' },
  { number: '103', service: 'Electric Corp.', notes: 'Power outages, electrical hazards', sms: '055-7000103' },
  { number: '104', service: 'Home Front Command', notes: 'Guidelines, alerts, emergency information', sms: '052-9104104' },
  { number: '106', service: 'Municipality', notes: 'Local information, municipal assistance (106-109)' },
  { number: '110', service: 'Police Info', notes: 'Road blocks, police information hotline' },
]

export const supportNumbers: EmergencyNumber[] = [
  { number: '118', service: 'Welfare Ministry', notes: 'Information and assistance' },
  { number: '1201', service: 'ERAN', notes: 'Emotional first aid hotline' },
  { number: '*8840', service: 'Senior Citizens', notes: 'Ministry of Social Equality' },
  { number: '*9696', service: 'National Insurance', notes: 'Counselling for elderly and families' },
  { number: '105', service: 'Missing Persons', notes: 'Missing persons hotline' },
  { number: '1-800-363-363', service: 'NATAL', notes: 'Trauma support' },
  { number: '03-6919765', service: 'NAAN', notes: 'Youth crisis line' },
  { number: '*4954', service: 'Tax Authority', notes: 'War property damage compensation claims' },
  { number: '1-700-707-889', service: 'Population Authority', notes: 'Foreign workers assistance' },
  { number: '04-7702651', service: 'Immigration Assistance', notes: 'English-language support' },
]

export interface GlossaryEntry {
  hebrew: string
  transliteration: string
  meaning: string
}

export const glossary: GlossaryEntry[] = [
  { hebrew: 'אזעקה', transliteration: 'Azaka', meaning: 'Alert / siren' },
  { hebrew: 'צבע אדום', transliteration: 'Tzeva Adom', meaning: '"Red Color" — the Red Alert warning' },
  { hebrew: 'ממ״ד', transliteration: 'Mamad', meaning: 'Apartment-level protected space' },
  { hebrew: 'ממ״ק', transliteration: 'Mamak', meaning: 'Floor-level protected space' },
  { hebrew: 'ממ״מ', transliteration: 'Mamam', meaning: 'Institutional / public building protected space' },
  { hebrew: 'מקלט', transliteration: 'Miklat', meaning: 'Public bomb shelter' },
  { hebrew: 'חדר מדרגות', transliteration: 'Khadar Madregot', meaning: 'Stairwell' },
  { hebrew: 'פיקוד העורף', transliteration: 'Pikud HaOref', meaning: 'Home Front Command (HFC)' },
  { hebrew: 'התרעה מקדימה', transliteration: "Hatra'a Makdima", meaning: 'Preliminary guideline (advance warning)' },
  { hebrew: 'הנחיה מיוחדת', transliteration: 'Hankhaya Meyukhedet', meaning: 'Special instruction' },
  { hebrew: 'ירי רקטות', transliteration: 'Yeri Raketot', meaning: 'Rocket fire' },
  { hebrew: 'חדירת כלי טיס עוין', transliteration: 'Khadirat Kli Tis Oyein', meaning: 'Hostile aerial vehicle infiltration' },
  { hebrew: 'חדירת מחבלים', transliteration: 'Khadirat Mekhabblim', meaning: 'Terrorist infiltration' },
  { hebrew: 'רעידת אדמה', transliteration: "Re'idat Adama", meaning: 'Earthquake' },
  { hebrew: 'חומרים מסוכנים', transliteration: 'Khomarim Mesukanim', meaning: 'Hazardous materials' },
  { hebrew: 'ניתן לצאת', transliteration: 'Nitan Latzeit', meaning: '"You may exit" — all-clear' },
  { hebrew: 'היכנסו למרחב המוגן', transliteration: 'Hikansu LaMerkhav HaMugan', meaning: '"Enter the protected space"' },
  { hebrew: 'שהו במרחב המוגן', transliteration: 'Shehu BaMerkhav HaMugan', meaning: '"Remain in the protected space"' },
  { hebrew: 'דלת פלדה', transliteration: 'Delet Plada', meaning: 'Steel/blast door' },
  { hebrew: 'חלון פלדה', transliteration: 'Khalon Plada', meaning: 'Steel window' },
  { hebrew: 'תריס', transliteration: 'Tris', meaning: 'Shutter' },
  { hebrew: 'פנס', transliteration: 'Panas', meaning: 'Torch / flashlight' },
  { hebrew: 'תיק חירום', transliteration: 'Tik Kherum', meaning: 'Emergency bag (go bag)' },
  { hebrew: 'מד״א', transliteration: 'Mada', meaning: 'Magen David Adom (ambulance/first aid)' },
  { hebrew: 'צה״ל', transliteration: 'Tzahal', meaning: 'IDF (Israel Defense Forces)' },
  { hebrew: 'משטרה', transliteration: 'Mishtara', meaning: 'Police' },
  { hebrew: 'כבאות', transliteration: "Kaba'ut", meaning: 'Fire service' },
  { hebrew: 'ועד בית', transliteration: "Va'ad Bayit", meaning: 'Building committee' },
  { hebrew: 'עורף', transliteration: 'Oref', meaning: 'Home front (civilian rear)' },
]

export interface RadioStation {
  station: string
  fm: string
  am: string
  notes: string
}

export const radioStations: RadioStation[] = [
  { station: "Kol Israel Reshet Bet (כאן ב')", fm: '95.5 / 97.8', am: '657 / 1206', notes: 'Primary national news; official HFC announcements' },
  { station: 'Galei Tzahal (גלצ)', fm: '102.3 / 103.0', am: '—', notes: 'IDF Radio; security updates' },
  { station: "Kol Israel Reshet Aleph (כאן א')", fm: '100.3 / 104.0', am: '531 / 1008', notes: 'National talk and news' },
  { station: "Kol Israel Reshet Gimel (כאן ג')", fm: '97.0 / 99.0', am: '—', notes: 'Hebrew music + news bulletins' },
  { station: 'Kol Israel Arabic (כאן בערבית)', fm: '99.5', am: '576 / 711', notes: 'Arabic-language news and alerts' },
  { station: "Kol Israel Reka (כאן רק\"ע)", fm: '101.5 / 104.5', am: '972', notes: 'Russian/Amharic/French/English news' },
]

export const radioNotes: string[] = [
  'FM frequencies vary by region. The frequencies above are approximate; scan nearby if no signal.',
  'AM is more reliable during emergencies — longer range, less affected by infrastructure damage, works inside buildings better than FM.',
  'During emergencies, all stations simulcast HFC announcements.',
  'Write your local frequencies on the radio itself with a permanent marker.',
]
