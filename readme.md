# 🎤 BarsAndBattles

**BarsAndBattles** ist ein Open-Source-Datenbankprojekt, das Beziehungen in der Schweizer Rap-Szene sichtbar macht – von langjährigen Freundschaften über Featurings bis hin zu öffentlichen Beefs.

## 📌 Ziel

Die Plattform dokumentiert und visualisiert:
- Rapper:innen & Crews
- Freundschaften & Featurings
- Beefs & Konflikte (zeitlich nachvollziehbar)
- Diskografien & gemeinsame Projekte

## 🧱 Tech Stack (geplant)

- **PostgreSQL** als relationale Datenbank
- **Supabase** oder **Hasura** als Backend/API Layer
- **Next.js** oder **SvelteKit** für das Frontend
- **Tailwind CSS** für Styling
- **Vercel** oder **Netlify** fürs Hosting

## 🗃️ Datenstruktur

Das Schema umfasst unter anderem:

- `Rapper`: Name, Herkunft, Crew-Zugehörigkeiten
- `Crew`: Name, Typ, Beschreibung
- `Beef`: Wer, wann, warum – mit Status
- `Freundschaft`: Freundschaften, Kollabos, Label-Partnerschaften
- `Diskografie`: Alben, EPs, Singles, Labels
- `Projekte`: Side-Hustles, Plattformen, Managements

➡ Siehe [`/schema.sql`](./schema.sql) für Details.

## 📈 Vorschau (bald)

Bald verfügbar: Eine interaktive Timeline und Netzwerk-Visualisierung (via D3.js oder vis.js).

## 🤝 Mitmachen

Du kennst wichtige Infos zur Szene? Du bist Teil davon?  
**Pull Requests & Issues willkommen!** 🙌

## 🧠 Inspiration

> "Es sind nicht nur Bars – es sind Geschichten."  
> – Jede Beziehung zählt.

## 📜 Lizenz

MIT License
