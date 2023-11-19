# ChatApp

## Workspace (Modules) layout

```
+ --- Workspace
    + --- App
    + --- API Service
    + --- Utility
```

## Chosen architecture

MVVM pattern is used with adding builders and presentations. 

```
+ ---- Application
    + ---- Container
        + ---- Router
            + ---- Scene
        + ---- APIService
            + ---- Entity
```

### App Layer

- AppDelegate: Starts and calls AppRouter.
- AppContainer: Contains app router, API service. 
- AppRouter: Creates UIWindow and starts application by calling product listing screen.

### Service

- API Service: Gets fake data without url session (offline working purpose) and converts conversation model.

### Available Screens

- Conversation Listing
- Conversation Detail 

### Testing

- Unit tests


# Future Improvements

- Persistance module and a composer to handle API requests with fallback
- UI testing
- Better UI/UX
- More test coverage:
    I could have made all the outlets private in the controllers. 
    And I could have added all the controller life cycle, delegate, and datasource methods to the viewmodel contract.
    It could improve code coverage.
