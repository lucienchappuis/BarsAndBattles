import { useState } from 'react'
import supabase from '../utils/supabase'

export default ({ reload }) => {
  const [title, setTitle] = useState('')

  const addRapper = async (e) => {
    e.preventDefault()
    await supabase.from('rapper').insert({ title })
    reload()
    setTitle('')
  }

  return (
    <form onSubmit={addRapper}>
      <input value={title} onChange={(e) => setTitle(e.target.value)} />
    </form>
  )
}