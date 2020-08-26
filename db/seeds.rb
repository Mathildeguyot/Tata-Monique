# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
edouard = User.new(first_name: "Edouard", last_name: "Giroult", birth_date: Date.new(1998, 7, 12), phone_number: "06 21 56 65 45 87", ID_number: "1700569254145", nationality: "française", birth_location: "Lyon", mail: "doudou.giroult@gmail.com", password: "tatamonique", username: "Doudou")

health = Health.new(ssn: "19807691561675432", social_security: "SMENO", health_insurance: "Apicil")
health.user = edouard
health.save

habitation = Habitation.new(number: 80, street: "Rue Lafayette", zip_code: "75010", city: "Paris", category: "Locataire", rent: 780, size: 22, lease_start_date: Date.new(2020, 8, 15), furnished: true)
habitation.user = edouard
habitation.save

familial_situation = FamilialSituation.new(children: 0, relationship: "célibataire")
familial_situation.user = edouard
familial_situation.save

professional_situation = ProfessionalSituation.new(income: 600, occupation: "vendeur", fiscal_number: 1345749738586, contract: "CDD", company_name: "Zara", status: "étudiant" )
professional_situation.user = edouard
professional_situation.save


task1 = Task.new(name: "Souscris à une assurance habitation", description: "Tu seras bien content de l'avoir si jamais tu as un dégât des eaux.", done: false, deadline: Date.new(2020, 8, 14), organization: "Luko")
task2 = Task.new(name: "Change ton adresse postale", description: "Mon Doudou, dès que tu déménages il faut prévenir la poste pour rediriger ton courrier au bon endroit !", done: true, deadline: Date.new(2020, 8, 15), organization: "La Poste")
task3 = Task.new(name:"Fais ta demande d'APL", description:"Tu viens d'emménager, il est temps de faire une demande d'APL, ça va te faire économiser sur ton loyer", done:false, deadline: Date.new(2020, 8, 20), organization:"CAF")
task4 = Task.new(name: "Informe ta banque de ton changement d'adresse", description: "Le Crédit Agricole fonctionne par région, je te conseille de changer d'adresse pour éviter de retourner là-bas pour la moindre démarche !", done: , deadline: Date.new(2020, 8, 20), organization:)
task5 = Task.new(name:"Déclare ton changement de situation à AMELI", description:"Doudou, tu entres dans la vie active, donc tu n'as plus droit à la Sécu étudiante, tu dois donc informer l'assurance maladie Ameli de ta nouvelle situation", done:false, deadline: Date.new(2020,9,15), organization:"Ameli")
task6 = Task.new(name: "Dis moi quelle est ta mutuelle", description: "Maintenant que tu joues dans la cour des grands tu as le droit à une mutuelle santé payée par ton travail.", done: false, deadline: Date.new(2020, 9, 15), organization: "Tata Monique")
task7 = Task.new(name:"Fais ta première déclaration d'impôts", description:"Garde ça dans un coin de ta tête, au mois de juin, tu devras faire ta première déclaration d'impôts !", done:false, deadline: Date.new(2020,6,12), organization:"Impots.gouv")

# subtask1 = Subtask.new(name:"Prépare tes documents", description:"Pour percevoir les APL, tu as besoin de plusieurs documents, mais ne t'inquiète pas, ils sont facilement trouvables !", done:false, deadline:Date.new(2020, 9, 15))
# subtask2 = Subtask.new(name:"Remplis le questionnaire de la CAF", description:"La CAF ", done:, deadline:)
