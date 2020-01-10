# Initialisation d'un projet Vue.js

## Création du container vuenodejs
```
make up
```

## Création du projet Vue.js dans le répertoire courant
```
make vue create .
```

 - Generate project in current directory?  => Y
 - Please pick a preset  => default (eslint, babel)
 - Pick the package manager to use when installing dependencies => default (yarn)

### Lancer le serveur web pour vérifier

```
make serve
```
accès via : http://localhost:8081/

pour voir les logs
```
make logs
```

### installation du plugin axios
```
make vue add axios
```

erreur de lint : modifier dans src/plugins/axios.js (42) :
 Plugin.install = function(Vue) {

### installation du plugin vuetify
```
make vue add vuetify
```

 - Choose a preset => default

## Rédémarrer le container et le serveur
```
make stop
make serve
```

