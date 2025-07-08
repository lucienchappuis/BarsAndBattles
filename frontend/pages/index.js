import { useState, useEffect } from 'react'
import supabase from '../utils/supabase'
import NewRapper from '../components/NewRapper'

export default function Home() {
  const [rapper, setRapper] = useState([])

  const fetchrappers = async () => {
    const { data } = await supabase.from('rapper').select('*')
    setRapper(data)
  }

  useEffect(() => {
    fetchrappers()
  }, [])

  return (
    <div className={styles.container}>
      <NewRapper reload={fetchrappers} />
      {rappers.map((todo) => (
        <p key={rapper.id}>{rapper.name}</p>
      ))}
    </div>
  )
}