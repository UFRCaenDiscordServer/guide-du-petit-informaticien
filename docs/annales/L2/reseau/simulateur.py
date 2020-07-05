from random import randint
 
#cette fonction traduit un message en une trame/sequence de bits. Cette fonction est maintenant simple, mais elle est insuffisante (elle ne permet pas de trouver le debut du message par exemple) le but de ce TP est de la completer.
def couche2(message_from_sender):
    return message_from_sender.replace("o","0").replace("i","1")
 
#cette fonction traduit une sequence de bits en un message. Cette fonction est maintenant simple, mais elle est insuffisante (elle ne permet pas de trouver le debut du message par exemple) le but de ce TP est de la completer.
def couche2R(bits_from_sender):
    return bits_from_sender.replace("0","o").replace("1","i")
 
 
#cette fonction represente la tradution niveau 1 faite par le codage NRZ
def couche1(trame_de_bits):
    return trame_de_bits.replace("0","-").replace("1","+")
 
#cette fonction represente la tradution faite par le codage NRZ
def couche1R(trame_de_bits):
    return trame_de_bits.replace("-","0").replace("+","1")
 
 
#Cette fonction simule l'état du canal (ex : un fil electrique).
#Un canal est présent avant que l'émetteur ne veuille envoyer le message. Il contient initialement du bruit: le recepteur etait a l'ecoute avant que l'emetteur n'envoie son message. 
#Il contient aussi un bruit final, car le recepteur sera aussi a l'ecoute apres l'envoi du message. 
#Le defi de la couche 2 est de permettre au recepteur de determiner ou commence et ou termine le message envoye.
def transmission(signal_from_sender):
#NE PAS MODIFIER CETTE FONCTION : elle simule le "monde reel", sur lequel vous n'avez pas prise. Le travail de ce TP consiste a modifier couche2 et couche2R
 
    print("Nombre de signaux necessaires pour envoyer le message:"+ str(len(signal_from_sender)))
    #bruit initial
    for x in range (0,randint(4, 10)):
        if randint(0,1) == 1:
            signal_from_sender = "-" + signal_from_sender
        else:
            signal_from_sender = "+" + signal_from_sender
 
    #bruit final
    for x in range (0,randint(4, 10)):
        if randint(0,1) == 1:
            signal_from_sender = signal_from_sender + "-"
        else:
            signal_from_sender = signal_from_sender + "+"
 
    return signal_from_sender
 
 
def emission(message_from_sender):
    print("message a envoyer:"+message_from_sender)
    trame_de_bits_envoyee = couche2(message_from_sender)
    print("trame a envoyer:"+trame_de_bits_envoyee)
    signal_envoye = couche1(trame_de_bits_envoyee)
    print("signal envoye:"+signal_envoye)
    return signal_envoye
 
def reception(signal_sur_canal):
    print("signal entendu, avec le bruit:"+signal_sur_canal)
    bits_recus = couche1R(signal_sur_canal)
    print("bits recus par le recepteur:"+bits_recus)
    message_recu = couche2R(bits_recus)
    print("message recu par le recepteur:"+message_recu)
    return message_recu
 
 
def simulation(message_from_sender):
    signal_envoye = emission(message_from_sender)
    signal_sur_canal = transmission(signal_envoye)
    return reception(signal_sur_canal)
 
print(simulation("oooiii"))
