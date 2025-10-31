# 🇫🇷 Analyse des élections présidentielles françaises de 2022

## 🧠 Objectif du projet
L’objectif de ce projet est d’analyser les **tendances politiques régionales en France métropolitaine** à partir des résultats des **élections présidentielles de 2022**.

> **Problématique :** Quelles sont les tendances politiques en fonction des zones géographiques en France métropolitaine ?

---

## 📊 Présentation du sujet
La base de données contient différentes informations électorales pour chaque **ville** de chaque **département** :
- Nombre d’inscrits  
- Nombre de votants  
- Nombre de votes pour chaque candidat au **premier** et **deuxième tour**

Pour simplifier l’analyse :
- Seules les **variables relatives aux pourcentages de voix** sont considérées.  
- Les **pourcentages du second tour** sont ajoutés comme **variables supplémentaires**.  
- Les résultats sont **agrégés par département** (moyenne des villes) pour une vision globale des tendances.

---

## 📈 Analyse descriptive et bivariée

### Statistiques univariées
Lors du **second tour** :
- Emmanuel **Macron** : ~52 % des votes  
- Marine **Le Pen** : ~48 % des votes  

**Médianes :**
- Macron → 51 %  
- Le Pen → 49 %  

Cela signifie que la moitié des départements ont voté majoritairement pour Macron et l’autre moitié pour Le Pen.

---

### 🔗 Matrice de corrélation
La matrice de corrélation permet d’identifier les liens entre les votes des candidats :

- 🔴 **Jean-Luc Mélenchon** et **Marine Le Pen** → corrélation **fortement négative** (-0.73)  
  → les départements votant pour Le Pen votent rarement pour Mélenchon.  
- 🟢 **Yannick Jadot** (1er tour) et **Emmanuel Macron** (2e tour) → corrélation **positive élevée** (0.70)  
  → les électeurs Jadot ont tendance à se reporter sur Macron au second tour.

📊 **Illustration :**

![Matrice de corrélation](https://github.com/Judicha502/Analyse-des-tendances-politiques-en-France-Election-2022-/blob/main/images/matrice%20de%20corre%CC%81lation.png)

---

## 🧮 Analyse géométrique des données (ACP)

### Pourquoi une ACP ?
Parce que : 
- Les données sont **quantitatives** et nombreuses.  
- L’objectif est d’observer les **tendances politiques régionales** à partir des votes.

➡️ **4 axes** retenus → expliquent **79 %** de l’inertie totale.  
(34.22 % + 21.66 % + 14.63 % + 8.51 %)

📊 **Histogramme des valeurs propres :**

![Valeurs propres - Critère du coude](https://github.com/Judicha502/Analyse-des-tendances-politiques-en-France-Election-2022-/blob/main/images/histogramme.png)

---

### Interprétation des axes

#### Axe 1 — 27.68 % de l’inertie totale  
Oppose :
- Les **candidats de gauche** (Mélenchon, Jadot…)  
- Aux **candidats de droite** (Le Pen, Pécresse…)

➡️ **Départements du sud** (Hérault, Gironde, Pyrénées-Atlantiques…) → vote **gauche**  
➡️ **Nord et centre** (Yvelines, Aube, Eure-et-Loir…) → vote **droite**

#### Axe 2 — 22.51 % de l’inertie totale  
Oppose :
- En haut : candidats proches des **classes populaires et ouvrières**  
- En bas : candidats moins proches de ces préoccupations  

📈 **Projection des individus (départements) :**

![ACP - Départements](https://github.com/Judicha502/Analyse-des-tendances-politiques-en-France-Election-2022-/blob/main/images/axe1.png)

📉 **Projection des variables (candidats) :**

![ACP - Candidats](https://github.com/Judicha502/Analyse-des-tendances-politiques-en-France-Election-2022-/blob/main/images/axe1%20copy.png)

---

## 🧭 Résultats principaux

| Zone géographique | Tendance politique dominante |
|-------------------|-------------------------------|
| Nord & Centre     | Droite / Extrême droite       |
| Sud               | Gauche                        |

Cette **polarisation nord-sud** met en lumière des différences probablement liées à des **facteurs socio-économiques et culturels**.

---

## 🧩 Conclusion
Cette analyse statistique et factorielle met en évidence une **fracture politique géographique** en France :
- 🧭 **Nord et centre** → votes orientés à **droite** ou **extrême droite**  
- 🌞 **Sud** → votes davantage portés vers la **gauche**

Ces résultats confirment que les comportements électoraux sont étroitement liés à la **géographie** et à la **structure sociale** des territoires.

---

## 🧰 Technologies utilisées
- **R / Excel** : analyses des données 
- **ACP (Analyse en Composantes Principales)** : réduction dimensionnelle & visualisation
