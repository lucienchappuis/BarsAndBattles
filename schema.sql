-- Konzeptuelles ER-Modell (vereinfacht in Pseudocode)

-- Tabelle: Rapper
CREATE TABLE Rapper (
    id UUID PRIMARY KEY,
    name TEXT NOT NULL,
    bürgerlicher_name TEXT,
    geburtsdatum DATE,
    herkunft_ort TEXT,
    herkunft_land TEXT
);

-- Tabelle: Crew
CREATE TABLE Crew (
    id UUID PRIMARY KEY,
    name TEXT NOT NULL,
    typ TEXT,
    beschreibung TEXT
);

-- Tabelle: Rapper_Crew (n:m + Zeit)
CREATE TABLE Rapper_Crew (
    rapper_id UUID REFERENCES Rapper(id),
    crew_id UUID REFERENCES Crew(id),
    von DATE,
    bis DATE,
    PRIMARY KEY (rapper_id, crew_id, von)
);

-- Tabelle: Freundschaft
CREATE TABLE Freundschaft (
    id UUID PRIMARY KEY,
    rapper1_id UUID REFERENCES Rapper(id),
    rapper2_id UUID REFERENCES Rapper(id),
    startdatum DATE,
    enddatum DATE,
    beschreibung TEXT,
    quelle TEXT
);

-- Tabelle: Beef
CREATE TABLE Beef (
    id UUID PRIMARY KEY,
    rapper1_id UUID REFERENCES Rapper(id),
    rapper2_id UUID REFERENCES Rapper(id),
    startdatum DATE,
    enddatum DATE,
    status TEXT CHECK (status IN ('aktiv', 'beendet', 'versöhnt')),
    beschreibung TEXT,
    quelle TEXT
);

-- Tabelle: Diskografie
CREATE TABLE Diskografie (
    id UUID PRIMARY KEY,
    rapper_id UUID REFERENCES Rapper(id),
    titel TEXT,
    typ TEXT CHECK (typ IN ('Album', 'EP', 'Single')),
    erscheinungsdatum DATE,
    label TEXT,
    links TEXT
);

-- Tabelle: Projekte
CREATE TABLE Projekte (
    id UUID PRIMARY KEY,
    rapper_id UUID REFERENCES Rapper(id),
    titel TEXT,
    beschreibung TEXT,
    startdatum DATE,
    enddatum DATE,
    quelle TEXT
);

-- === Beispielhafte Testdaten ===
-- Rapper
INSERT INTO Rapper (id, name, bürgerlicher_name, geburtsdatum, herkunft_ort, herkunft_land) VALUES
('00000000-0000-0000-0000-000000000001', 'Stress', 'Andres Andrekson', '1977-07-25', 'Lausanne', 'Schweiz'),
('00000000-0000-0000-0000-000000000002', 'Mimiks', 'Mimmo Pisino', '1991-05-05', 'Luzern', 'Schweiz'),
('00000000-0000-0000-0000-000000000003', 'Xen', NULL, '1993-03-10', 'Bern', 'Schweiz'),
('00000000-0000-0000-0000-000000000004', 'LCone', NULL, '1991-12-12', 'Bern', 'Schweiz'),
('00000000-0000-0000-0000-000000000005', 'Nativ', NULL, '1992-08-30', 'Biel', 'Schweiz'),
('00000000-0000-0000-0000-000000000006', 'Pronto', NULL, '1993-01-01', 'Solothurn', 'Schweiz'),
('00000000-0000-0000-0000-000000000007', 'EAZ', 'Eronit Aliu', '1994-09-09', 'Zürich', 'Schweiz'),
('00000000-0000-0000-0000-000000000008', 'Arthi', 'Arjanit Mehmeti', '1990-06-06', 'Basel', 'Schweiz'),
('00000000-0000-0000-0000-000000000009', 'L Loko', NULL, '1988-02-14', 'Zürich', 'Schweiz'),
('00000000-0000-0000-0000-000000000010', 'Drini', NULL, '1995-04-04', 'Zürich', 'Schweiz');

-- Crews
INSERT INTO Crew (id, name, typ, beschreibung) VALUES
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa1', 'Boys on Pills', 'Crew', 'LCone + Mimiks'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa2', 'Eldorado FM', 'Kollektiv', 'LCone, CBN, Tommy Vercetti'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa3', 'Hutmacher Entertainment', 'Label', 'u. a. EAZ, Arthi'),
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa4', 'DMO', 'Crew', 'L Loko & Drini');

-- Rapper_Crew
INSERT INTO Rapper_Crew (rapper_id, crew_id, von, bis) VALUES
('00000000-0000-0000-0000-000000000002', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '2015-01-01', NULL),
('00000000-0000-0000-0000-000000000004', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '2015-01-01', NULL),
('00000000-0000-0000-0000-000000000004', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '2011-01-01', NULL),
('00000000-0000-0000-0000-000000000007', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa3', '2020-01-01', NULL),
('00000000-0000-0000-0000-000000000008', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa3', '2020-01-01', NULL),
('00000000-0000-0000-0000-000000000009', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa4', '2017-01-01', NULL),
('00000000-0000-0000-0000-000000000010', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaa4', '2017-01-01', NULL);

-- Freundschaften
INSERT INTO Freundschaft (id, rapper1_id, rapper2_id, startdatum, enddatum, beschreibung, quelle) VALUES
('f0000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000004', '2015-01-01', NULL, 'Boys on Pills', 'Interview 2016'),
('f0000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000005', '2019-01-01', NULL, 'Kollabo-Album „Louvre“', 'Spotify'),
('f0000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000007', '00000000-0000-0000-0000-000000000008', '2020-01-01', NULL, 'Label Hutmacher', 'Labelseite');

-- Beefs
INSERT INTO Beef (id, rapper1_id, rapper2_id, startdatum, enddatum, status, beschreibung, quelle) VALUES
('b0000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000005', '2016-01-01', '2018-12-01', 'beendet', 'Politischer Diss (SRF Virus)', 'SRF Virus'),
('b0000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000009', '00000000-0000-0000-0000-000000000007', '2022-05-01', NULL, 'aktiv', 'EAZ-Diss gegen L Loko', 'Instagram');
