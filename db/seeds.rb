# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require "open-uri"
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Usertask.destroy_all
Usersubtask.destroy_all
Health.destroy_all
Subtask.destroy_all
Task.destroy_all
Habitation.destroy_all
FamilialSituation.destroy_all
ProfessionalSituation.destroy_all
Document.destroy_all
User.destroy_all

edouard = User.new(first_name: "Edouard", last_name: "Giroult", birth_date: Date.new(1998, 7, 12), zip_code_location:"69001", phone_number: "06 21 56 65 45 87", ID_number: "1700569254145", nationality: "française", birth_location: "Lyon", email: "doudou.giroult69@gmail.com", password: "tatamonique", username: "Doudou")
edouard.save

health = Health.new(ssn: "198076915616754", social_security: "SMENO", health_insurance: "Apicil")
health.user = edouard
health.save


habitation = Habitation.new(number: 10, street: "rue de la République", zip_code: "69001", city: "Lyon", category: "Locataire", rent: 0, size: 0, lease_start_date: Date.new(2020, 9, 4), furnished: true)
habitation.user = edouard
habitation.save

familial_situation = FamilialSituation.new(children: 0, relationship: "célibataire")
familial_situation.user = edouard
familial_situation.save

professional_situation = ProfessionalSituation.new(income: 600, occupation: "vendeur", fiscal_number: 1345749738586, contract: "CDD", company_name: "Zara", status: "étudiant", iban:"FR9417569000308557721711I12", fiscal_attach: false )
professional_situation.user = edouard
professional_situation.save


# carte_didentite_photo = URI.open('https://res.cloudinary.com/dyyx7p742/image/upload/v1598618846/IDENTITE_ghztxw.pdf')
# carte_didentite = Document.new(name: "Carte d'identité", category: "La mif")

# carte_didentite.photo.attach(io: carte_didentite_photo, filename: 'IDENTITE.pdf')
# carte_didentite.user = edouard
# carte_didentite.save!

# rib_photo = URI.open('https://res.cloudinary.com/dyyx7p742/image/upload/v1598534082/RIB_pgmd6i.pdf')
# rib = Document.new(name: "RIB", category: "Le boulot")
# rib.photo.attach(io: rib_photo, filename: 'RIB.pdf')
# rib.user = edouard
# rib.save!

# contrat_location_photo = URI.open('https://res.cloudinary.com/dyyx7p742/image/upload/v1598618882/contrat_location_hxnhjd.pdf')
# contrat_location = Document.new(name: "Contrat de location", category: "La casa")
# contrat_location.photo.attach(io: contrat_location_photo, filename: 'contrat_location.pdf')
# contrat_location.user = edouard
# contrat_location.save!

# attestation_loyer_photo = URI.open('https://res.cloudinary.com/dyyx7p742/image/upload/v1598618889/attestation_de_loyer_nedr0n.pdf')
# attestation_loyer = Document.new(name: "Attestation de loyer", category: "La casa")
# attestation_loyer.photo.attach(io: attestation_loyer_photo, filename: 'attestation_loyer.pdf')
# attestation_loyer.user = edouard
# attestation_loyer.save!

task1 = Task.new(name:"Fais ta demande d'APL", description:"Tu viens d'emménager, il est temps de faire une demande d'APL, ça va te faire économiser sur ton loyer.", deadline: Date.new(2020, 9, 10), organization:"CAF")
task1.save
task2 = Task.new(name: "Souscris à une assurance habitation", description: "Tu seras bien content de l'avoir si jamais tu as un dégât des eaux.", deadline: Date.new(2020, 9, 11), organization: "Luko")
task2.save
task3 = Task.new(name: "Change ton adresse postale", description: "Mon Doudou, dès que tu déménages il faut prévenir la poste pour rediriger ton courrier au bon endroit !", deadline: Date.new(2020, 9, 11), organization: "La Poste")
task3.save
task4 = Task.new(name: "Informe ta banque de ton changement d'adresse", description: "Le Crédit Agricole fonctionne par région, je te conseille de changer d'adresse pour éviter de retourner là-bas pour la moindre démarche !",  deadline: Date.new(2020, 9, 13), organization: "Crédit Agricole")
task4.save
task5 = Task.new(name:"Déclare ton changement de situation à AMELI", description:"Doudou, tu entres dans la vie active, donc tu n'as plus droit à la Sécu étudiante, tu dois donc informer l'assurance maladie Ameli de ta nouvelle situation.", deadline: Date.new(2020,9,15), organization:"Ameli")
task5.save
task6 = Task.new(name: "Dis moi quelle est ta mutuelle", description: "Maintenant que tu joues dans la cour des grands tu as le droit à une mutuelle santé payée par ton travail.",  deadline: Date.new(2020, 9, 15), organization: "Tata Monique")
task6.save
task7 = Task.new(name:"Fais ta première déclaration d'impôts", description:"Garde ça dans un coin de ta tête, au mois de juin, tu devras faire ta première déclaration d'impôts !",  deadline: Date.new(2021, 6, 12), organization:"Impots.gouv")
task7.save

[task1,task2, task3, task4, task5, task6, task7].each do |task|
  Usertask.create(task: task, user: edouard, done:false)
end

# CAF Subtasks
subtask1 = Subtask.new(name:"Upload ta carte d'identité", description:"La CAF a besoin de vérifier ton identité.",  deadline:Date.new(2020, 9, 9), subtask_type: "upload", document_type: 'Identité.pdf', task:task1)
subtask1.save
subtask2 = Subtask.new(name:"Upload ton RIB", description:"Entre le RIB sur lequel tu veux que les APL soient versées.",  deadline:Date.new(2020, 9, 9), subtask_type: "upload", document_type: "RIB.pdf", task:task1)
subtask2.save
subtask3 = Subtask.new(name:"Complète ton attestation de loyer", description:"Télécharge ton attestation de loyer #{"<a class='underline--magical juste-ici' href='https://www.aide-sociale.fr/wp-content/uploads/2018/05/attestation-loyer-apl-21.pdf'>juste ici</a>"}, et upload-la ci-dessous.", deadline: Date.new(2020, 9, 9), subtask_type: "upload", document_type: 'AttestationLoyer.pdf', task:task1)
subtask3.save
subtask4 = Subtask.new(name:"Remplis le questionnaire de la CAF", description:"Tous les champs seront déja pré-remplis par Tata Monique si tu actives l'extension ! #{"<br><br><img src='https://res.cloudinary.com/deylw9hu5/image/upload/v1599137125/image_btlwls.png' width='230px'><br><br>"} #{"<a class='btn btn-validate white' href='https://wwwd.caf.fr/wps/portal/caffr/aidesetservices/lesservicesenligne/faireunedemandedeprestation/demanderlaideaulogementexperimentation/!ut/p/a0#/acces' target='_blank'>C'est parti !</a>"}", deadline:Date.new(2020, 9, 9), subtask_type: "form", document_type: "CAF-form", task:task1)
# extension = URI.open()
# subtask4.photo.attach(io: extension, filename: 'extension.png', )
subtask4.save

Usersubtask.create(subtask: subtask1, user: edouard, done:false)

[subtask2, subtask3, subtask4].each do |subtask|
   Usersubtask.create(subtask: subtask, user: edouard, done:false)
end

# ASSURANCE HAB
subtask5 = Subtask.new(name:"Upload ta carte d'identité", description:"Luko a besoin de vérifier ton identité.",  deadline:Date.new(2020, 9, 11), subtask_type: "upload", document_type: "IDENTITE.pdf", task:task2)
subtask5.save
Usersubtask.create(subtask: subtask5, user: edouard, done:false)

#LA POSTE
subtask6 = Subtask.new(name:"Upload ta carte d'identité", description:"La Poste a besoin de vérifier ton identité.",  deadline:Date.new(2020, 9, 11), subtask_type: "upload", document_type: 'IDENTITE.pdf', task:task3)
subtask6.save
Usersubtask.create(subtask: subtask6, user: edouard, done:false)

#CREDIT AGRICOLE
subtask7 = Subtask.new(name:"Upload ta carte d'identité", description:"Le Crédit Agricole a besoin de vérifier ton identité",  deadline:Date.new(2020, 9, 13), subtask_type: "upload", document_type: "IDENTITE.pdf", task:task4)
subtask7.save
Usersubtask.create(subtask: subtask7, user: edouard, done:false)

#AMELI
subtask8 = Subtask.new(name:"Upload ta carte d'identité", description:"AMELI a besoin de vérifier ton identité",  deadline:Date.new(2020, 9, 15), subtask_type: "upload", document_type: 'IDENTITE.pdf', task:task5)
subtask8.save
Usersubtask.create(subtask: subtask8, user: edouard, done:false)

#TATA MONIQUE
subtask9= Subtask.new(name:"Upload ta carte d'identité", description:"Histoire qu'on trouve ta mutuelle !",  deadline:Date.new(2020, 8, 15), subtask_type: "upload", document_type:'IDENTITE.pdf', task:task6)
subtask9.save
Usersubtask.create(subtask: subtask9, user: edouard, done:false)

#IMPOTS.GOUV
subtask10= Subtask.new(name:"Upload ta carte d'identité", description:"Les impôts ont besoin de vérifier ton identité",  deadline:Date.new(2021, 6, 12), subtask_type: "upload", document_type:'IDENTITE.pdf', task:task7)
subtask10.save
Usersubtask.create(subtask: subtask10, user: edouard, done:false)

# Usersubtask.create(subtask: subtask1, user: edouard, done: true)

# subtask4 = Subtask.new(name: "Créé-toi un compte", description: "Tu n'as probablement pas encore de compte Ameli. Rends-toi sur le site Ameli.fr, grâce à l'extension Tata Monique, tous les champs seront préremplis, même pas besoin d'aller chercher ta carte vitale !", deadline: Date.new(2020, 9, 1), done: false)
# subtask5 = Subtask.new(name: "Déclare ton changement d'adresse", description: "Clique ici ! Encore une fois, tous les champs sont préremplis avec l'adresse de ton nouveau logement. Tu devrais recevoir un petit mail d'Ameli dans les 7 jours pour te confirmer ton changement d'adresse. Je t'enverrai un petit rappel de vérification !", deadline: Date.new(2020, 9, 2), done: false)
# [subtask4, subtask5].each do |subtask|
#   subtask.task = task5
#   subtask.save
# end


