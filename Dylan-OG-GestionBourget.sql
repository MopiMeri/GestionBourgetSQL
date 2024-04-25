DROP TABLE IF EXISTS emplacement;
DROP TABLE IF EXISTS entreprise;
DROP TABLE IF EXISTS contact;

--
-- Structure de la table `emplacement`
--

CREATE TABLE IF NOT EXISTS emplacement (
  `id` int NOT NULL AUTO_INCREMENT,
  `hall` varchar(2) NOT NULL,
  `parcelle` varchar(3) NOT NULL,
  CONSTRAINT pk_emplacement PRIMARY KEY emplacement(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE IF NOT EXISTS entreprise (
  `id` int NOT NULL AUTO_INCREMENT,
  `raisonSociale` varchar(250) NOT NULL,
  `siret` varchar(100) DEFAULT NULL,
  `idEmplacement` int NOT NULL,
  CONSTRAINT pk_entreprise PRIMARY KEY entreprise(id),
  CONSTRAINT fk_idEmplacement FOREIGN KEY (idEmplacement) REFERENCES emplacement(id),
  CONSTRAINT uc_idEmplacement UNIQUE (idEmplacement)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE IF NOT EXISTS contact (
  `id` int NOT NULL AUTO_INCREMENT,
  `telephone` varchar(250) NOT NULL,
  `prenom` varchar(250) NOT NULL,
  `idEntreprise` int NOT NULL,
  CONSTRAINT pk_contact PRIMARY KEY contact(id),
  CONSTRAINT fk_idEntreprise FOREIGN KEY (idEntreprise) REFERENCES entreprise(id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Déchargement des données de la table `emplacement`
--

INSERT INTO emplacement (hall, parcelle) VALUES
('A1', '001'),
('A1', '002'),
('B2', '001'),
('B2', '002');

-- --------------------------------------------------------

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO entreprise (raisonSociale, siret, idEmplacement) VALUES
('Entreprise A', '553 279 879 00672', 1),
('Entreprise B', '553 279 879 00673', 2),
('Entreprise C', '553 279 879 00674', 3);

-- --------------------------------------------------------

--
-- Déchargement des données de la table `contact`
--

INSERT INTO contact (telephone, prenom, idEntreprise) VALUES
('0184294877', 'John', 1),
('0682746129', 'Alice', 2),
('0784629488', 'Bob', 3);

COMMIT;