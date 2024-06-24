# [Lavinou Questionnaire Developer](https://questionnaire.lavinou.com/developer)

## Introduction
Welcome to the Questionnaire SDK repository. Here you will learn how to use the Questionnaire
SDK for iOS Applications.


## Project Key
Once android gradle file is setup and you have access to the questionnaire sdk, a project api key
is required to access your questionnaires. To create the project key go to your [projects](https://questionnaire.lavinou.com/console/projects/),
select the project you would like to have an api key for and click on the **+ API KEY** button. Copy the key
and add it to the Questionnaire Builder:
```swift
let questionnaire = Questionnaire
            .Builder(apiKey: "<project-api-key>")
            .build()
```

## Showing Questionnaire
Once you have the questionnaire setup you can launch questionnaires as you please.
```swift
questionnaire.launch(id: "<questionnaire-id>")
```
