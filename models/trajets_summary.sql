SELECT
  sc.nom_segment,
  COUNT(t.id_trajet) AS nombre_trajets,
  SUM(t.montant_total) AS total_revenus
FROM `vtcparis.faits_trajets` t
JOIN `vtcparis.clients` c ON t.id_client = c.id_client
JOIN `vtcparis.segments_clients` sc ON c.id_segment = sc.id_segment
JOIN `vtcparis.vehicules` v ON t.id_vehicule = v.id_vehicule
GROUP BY sc.nom_segment
ORDER BY total_revenus DESC