import sys
from random import randint

###############################################################
# Fonctions utiles
###########################


def binaire(n):
    L = []
    bine = ""
    if n == 0:
        bine += "0"
    while n != 0:
        L.append(n % 2)
        n = n // 2
    L = L[::-1]
    for k in range(len(L)):
        bine += str(L[k])
    return(bine)


def binedec(bi):
    bi = str(bi)
    bi = bi[::-1]
    nb = 0
    for k in range(len(bi)):
        nb += int(bi[k]) * (2 ** k)
    return nb

###############################################################

###############################################################
# Couche liaison de données 
###########################


# Adresses de l'émetteur et récepteur
emetteur = '1001'
recepteur = '0110'


def addIdentification(message_from_sender, emetteur, recepteur):
    return recepteur + emetteur + message_from_sender


def isAdressedToMe(message_recu, me):
    id_me = binedec(me)
    id_recepteur = binedec(message_recu[0:4])
    return id_me == id_recepteur


def parity_bit(message):
    cpt1 = 0
    for x in message:
        if x == '1' or x == 'i':
            cpt1 += 1
    return cpt1 % 2


def double_parity_bit(message, n):
    # Puisque le message doit être représenté avec un tableau pour que la parité soit calculée sur chaque ligne et sur chaque colonne (double)
    # on calcule d'abord le nombre possible de lignes en fonction de la valeur de n.
    lenMess = len(message)
    if lenMess % n != 0:
        nb_ligne = lenMess // n + 1
    else:
        nb_line = lenMess // n

    #obtention des séparateurs du message par n bits et calcul des bits verticaux
    listeCoupe = []
    verti = ""
    for k in range(nb_ligne-1):
        listeCoupe.append(message[n*k:n*k+n])
        verti += str(parity_bit(listeCoupe[k]))
    k += 1
    listeCoupe.append(message[n*k:] + (n - lenMess%n)*'0')
    verti += str(parity_bit(listeCoupe[k]))
    
    # TODO: récupération des bits horizontaux.    
    hori = ""

    return verti, hori

def crc(message, pol):
    # TODO :complétez le code.
    res = ""
    return res


def codage_hamming(message):
    # TODO :complétez le code.
    message_hamming = ""
    return message_hamming


def correc_hamming(message):
    # TODO :complétez le code.
    message_corrected = ""
    return message_corrected


def decode_hamming(message_hamming):
    message = ""
    # TODO :complétez le code.
    return message


# cette fonction traduit un message en une trame/sequence de bits. Cette fonction est maintenant simple, mais elle est insuffisante (elle ne permet pas de trouver le debut du message par exemple) le but de ce TP est de la completer.
def couche2(message_of_sender):
    # On calcule la parité sur le message à envoyer
    parite = parity_bit(message_of_sender)
    bits_of_sender = addIdentification(message_of_sender, emetteur, recepteur).replace("o", "0").replace("i", "1")
    msglen_bin = binaire(len(message_of_sender))
    msglen_bin = (8 - len(msglen_bin)) * '0' + msglen_bin
    bits_of_sender = '01111110' + msglen_bin + bits_of_sender + str(parite)
    return bits_of_sender

 
# cette fonction traduit une sequence de bits en un message. Cette fonction est maintenant simple, mais elle est insuffisante (elle ne permet pas de trouver le debut du message par exemple) le but de ce TP est de la completer.
def couche2R(bits_from_sender):
    i = 0
    len_bits = len(bits_from_sender)
    debut = '01111110'
    while i < (len_bits - 7) and bits_from_sender[i : i + 8] != debut:
        i += 1
    if i >= len_bits - 7:
        return ""
    n = len(debut)
    bits_from_sender = bits_from_sender[i + n:]
    msglen = int(binedec(bits_from_sender[0:8]))
    bits_from_sender = bits_from_sender[8:8 + 4 + 4 + msglen + 1]
    if isAdressedToMe(bits_from_sender, recepteur):
        sender = bits_from_sender[4:4 + 4]
        bits_from_sender = bits_from_sender[4 + 4:]
        parite_envoyee = bits_from_sender[msglen]
        bits_from_sender = bits_from_sender[0:msglen]
        parite_calculee = parity_bit(bits_from_sender)
        print(bits_from_sender, parite_envoyee, parite_calculee)
        if parite_calculee == int(parite_envoyee):
            return bits_from_sender.replace("0", "o").replace("1", "i"), sender
        else:
            print("Trame contient des erreurs!")
            return "", ""
    else:
        return "", ""
    
###############################################################

###############################################################
# Couche physique 
#####################

# codage NRZI
def nrzi(bit):
    res = ""
    val = "-+"[int(bit[0])]
    for i in range(len(bit)):
        if bit[i] == "0":
            res += val
        else:
            if val == "+":
                val = "-"
            else:
                val = "+"
            res += val
    return res


# cette fonction represente la tradution niveau 1 faite par le codage NRZ
def couche1(trame_de_bits):
    return trame_de_bits.replace("0", "-").replace("1", "+")


# cette fonction represente la tradution faite par le codage NRZ
def couche1R(trame_de_bits):
    return trame_de_bits.replace("-", "0").replace("+", "1")

###############################################################
# Module de simulation 
########################


def signalSwapError(message, n):
    if message[n] == '+':
        return message[:n] + '-' + message[n + 1:]
    elif message[n] == '-':
        return message[:n] + '+' + message[n + 1:]
    else:
        print("Erreur: signal non valide!")
        sys.exit(1)

 
# Cette fonction simule l'état du canal (ex : un fil electrique).
# Un canal est présent avant que l'émetteur ne veuille envoyer le message. Il contient initialement du bruit: le recepteur etait a l'ecoute avant que l'emetteur n'envoie son message. 
# Il contient aussi un bruit final, car le recepteur sera aussi a l'ecoute apres l'envoi du message. 
# Le defi de la couche 2 est de permettre au recepteur de determiner ou commence et ou termine le message envoye.
def transmission(signal_from_sender):
    # TODO : Altération des données avant l'envoi
    signal_from_sender = signalSwapError(signal_from_sender, 28)
    print("Nombre de signaux necessaires pour envoyer le message:" + str(len(signal_from_sender)))
    # bruit initial
    for x in range (0, randint(4, 10)):
        if randint(0, 1) == 1:
            signal_from_sender = "-" + signal_from_sender
        else:
            signal_from_sender = "+" + signal_from_sender
 
    # bruit final
    for x in range (0, randint(4, 10)):
        if randint(0, 1) == 1:
            signal_from_sender = signal_from_sender + "-"
        else:
            signal_from_sender = signal_from_sender + "+"
 
    return signal_from_sender
 
 
def emission(message_from_sender):
    print("message a envoyer: " + message_from_sender)
    trame_de_bits_envoyee = couche2(message_from_sender)
    print("trame a envoyer: " + trame_de_bits_envoyee)
    signal_envoye = couche1(trame_de_bits_envoyee)
    print("signal envoyé: " + signal_envoye)
    return signal_envoye

 
def reception(signal_sur_canal):
    print("signal entendu, avec le bruit: " + signal_sur_canal)
    bits_recus = couche1R(signal_sur_canal)
    print("bits recus par le recepteur: " + bits_recus)
    message_recu, sender = couche2R(bits_recus)
    if message_recu != "" :
        print("message recu par le recepteur: " + message_recu)
        print("Envoye par : " + sender)
        return message_recu
    else:
        return "message ignoré"
 
 
def simulation(message_from_sender):
    signal_envoye = emission(message_from_sender)
    signal_sur_canal = transmission(signal_envoye)
    return reception(signal_sur_canal)

 
print(simulation("oooiii"))
###############################################################
