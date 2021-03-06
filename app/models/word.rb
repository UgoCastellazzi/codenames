class Word < ApplicationRecord

    # si le mot est déjà dans word_list, générer un nouveau mot
    # fonction generate word avec couleur en variable

    def self.generate_word_list
        words_available = ["aide","chef","enfant","garde","gauche","geste","gosse","livre","merci","mort","ombre","part","poche","professeur","tour","fois","madame","paix","voix","affaire","année","arme","armée","attention","balle","boîte","bouche","carte","cause","chambre","chance","chose","classe","confiance","couleur","cour","cuisine","dame","dent","droite","école","église","envie","épaule","époque","équipe","erreur","espèce","face","façon","faim","famille","faute","femme","fenêtre","fête","fille","fleur","force","forme","guerre","gueule","habitude","heure","histoire","idée","image","impression","jambe","joie","journée","langue","lettre","lèvre","ligne","lumière","main","maison","maman","manière","marche","merde","mère","minute","musique","nuit","odeur","oreille","parole","partie","peau","peine","pensée","personne","peur","photo","pièce","pierre","place","police","porte","présence","prison","putain","question","raison","réponse","robe","route","salle","scène","seconde","sécurité","semaine","situation","soeur","soirée","sorte","suite","table","terre","tête","vérité","ville","voiture","avis","bois","bras","choix","corps","cours","gars","mois","pays","prix","propos","sens","temps","travers","vieux","accord","agent","amour","appel","arbre","argent","avenir","avion","bateau","bébé","besoin","bonheur","bonjour","bord","boulot","bout","bruit","bureau","café","camp","capitaine","chat","chemin","chéri","cheval","cheveu","chien","ciel","client","cœur","coin","colonel","compte","copain","côté","coup","courant","début","départ","dieu","docteur","doigt","dollar","doute","droit","effet","endroit","ennemi","escalier","esprit","état","être","exemple","fait","film","flic","fond","français","frère","front","garçon","général","genre","goût","gouvernement","grand","groupe","haut","homme","honneur","hôtel","instant","intérêt","intérieur","jardin","jour","journal","lieu","long","maître","mari","mariage","matin","médecin","mètre","milieu","million","moment","monde","monsieur","mouvement","moyen","noir","nouveau","numéro","oeil","oiseau","oncle","ordre","papa","papier","parent","passage","passé","patron","père","petit","peuple","pied","plaisir","plan","point","pouvoir","premier","présent","président","prince","problème","quartier","rapport","regard","reste","retard","retour","rêve","revoir","salut","sang","secret","seigneur","sentiment","service","seul","siècle","signe","silence","soir","soldat","soleil","sourire","souvenir","sujet","téléphone","tout","train","travail","trou","truc","type","vent","ventre","verre","village","visage","voyage","fils","gens"]
        word_list = []
        9.times do
            word = Word.generate_word("red", words_available)
            word_list << word
            words_available.reject{ |element| element == word.content}
        end
        8.times do
            word = Word.generate_word("blue", words_available)
            word_list << word
            words_available.reject{ |element| element == word.content}
        end
        7.times do
            word = Word.generate_word("white", words_available)
            word_list << word
            words_available.reject{ |element| element == word.content}
        end
        word = Word.generate_word("black", words_available)
        word_list << word
        words_available.reject{ |element| element == word.content}
        word_list.shuffle
    end

    def self.generate_word(color, words_available)
        word = Word.new
        word.content = words_available.sample.capitalize
        word.color = color
        word.revealed = false
        word.save
        word
    end

    def reveal
        self.revealed = true
        self.save
    end
end
