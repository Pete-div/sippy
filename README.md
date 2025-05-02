This project is a Flutter shopping cart app that allows users to shop collaboratively in real-time using a shared cart session.

✅ Key Features
🔄 Stacked (MVVM) architecture using the stacked package for clean separation of concerns.

👥 A creator or invited user can start or join a shared cart session.

🛍️ Each participant can add products to the shared cart.

👤 Each item tracks who added it, with support for multiple users in one session.

✅ The session can be marked as done by any participant once shopping is complete.

🧠 Architecture
This project uses:

MVVM pattern via the stacked package

SharedPreferences to persist cart session data locally

Provider/Service structure for session and user state

Models for product and cart items

Reactive ViewModels for UI responsiveness

