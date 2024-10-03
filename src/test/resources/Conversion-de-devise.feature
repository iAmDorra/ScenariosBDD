Feature: Conversion de devise

   Scenario: Conversion vers une même devise pour un montant entier
      When Je convertis 1 "EUR" en "EUR"
      Then Je dois avoir 1 "EUR"

   Scenario: Conversion vers une même devise pour un montant avec décimales
      When Je convertis 2.5 "USD" en "USD"
      Then Je dois avoir 2.5 "USD"

   Scenario: Si j'ai un montant négatif, je ne peux pas convertir
      When Je convertis -1 "EUR" en "EUR"
      Then Je ne peux pas convertir

   Scenario: J'ai un montant de -2.5, je ne peux pas convertir
      When Je convertis -2.5 "USD" en "USD"
      Then Je ne peux pas convertir

   Scenario: On ne peut pas mettre de lettre dans le montant
      When Je convertis "abc" "USD" en "USD"
      Then Je ne peux pas convertir

   Scenario: On ne peut pas mettre de caractère spécial dans le montant
      When Je convertis "!?:" "USD" en "USD"
      Then Je ne peux pas convertir

   Scenario: Je multiplie le montant en entrée par le taux de change
      Given Le taux de change de "EUR" à "USD" est de 1.32
      When Je convertis 0 "EUR" en "USD"
      Then Je dois avoir 0 "USD"

   Scenario: Je multiplie le montant en entrée par le taux de change à 1
      Given Le taux de change de "EUR" à "CAD" est de 1
      When Je convertis 2 "EUR" en "CAD"
      Then Je dois avoir 2 "CAD"
