// pages/test.tsx
import { useEffect, useState } from 'react'
import { supabase } from '../lib/supabaseClient'

export default function TestPage() {
  const [rappers, setRappers] = useState([])

  useEffect(() => {
    supabase.from('Rapper').select('*').then(({ data, error }) => {
      if (error) console.error('Fehler:', error)
      else setRappers(data ?? [])
    })
  }, [])

  return (
    <div className="p-4">
      <h1 className="text-xl font-bold">Alle Rapper</h1>
      <ul>
        {rappers.map(r => (
          <li key={r.id}>{r.name} ({r.herkunft_ort})</li>
        ))}
      </ul>
    </div>
  )
}