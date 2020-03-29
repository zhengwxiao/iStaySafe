## The Team

- Zheng "Z" Xiao
- Will Lowry
- Andrew Chin

## Inspiration

COVID-19 is a serious problem. The best way for the world to overcome this novel virus is to stop the chain of transmission. The CDC (Centers for Disease Control and Prevention)  emphasizes that the virus is spread through respiratory droplets produced from coughing and sneezing. In short, the easiest way to protect others and yourself is simple: **don't touch your face!**

## What it does

We built **iStaySafe** to keep users from touching their faces with unwashed hands. Well, touching their faces with hands period. Think of everything you touch in a single day. Gross.

The Apple watchOS application tracks its wearer's movements using the built-in hardwarde accelerometer and gyroscope. When the watch detects that the wearer is voluntarily (or involuntarily) reaching for their face, it emits an alert and reminds the user on-screen to avoid touching their face.

The sister iOS application provides helpful reminders to keep users' hands and frequently-used surfaces clean. The app delivers a push notification on a custom interval to ensure the user is mindful of the cleanliness of their areas. Furthermore, the app gives tips for staying healthy amidst the pandemic and important information about self-monitoring or what to do if you develop symptoms!

## How we built it

We used Swift, Xcode, and CoreML to build this native iOS and watchOS app.

## Challenges we ran into

A majority of the team had never used machine learning in a project outside of class. It took quite a while to understand the basic process, learn the CoreML framework, and get started with data collection, training, and testing. Also, (I believe) it was all of our first virtual hackathon! We missed the free food and cup stacking, but we still ended up with a finished project and no-sleep!

## Accomplishments that we're proud of

Two-thirds of our team had never utilized machine learning in a hackathon project until today! Also, it was an interesting challenge to find a way to spread awareness of common preventions and precautions regarding the novel Coronavirus. Also, we submitted a project, whoop!

## What we learned

We learned how to leverage accelerometer/gyroscope data to determine human gestures and how to use Apple's CoreML for training and testing classification models. We learned simple ways to protect ourselves and our communities from COVID-19. Finally, we learned that collecting raw data, cleaning/analyzing data sets, and training models is nowhere near as fun as it sounds ;P.

## What's next for iStaySafe

If the app works, there will be no need for iStaySafe in the future (at least for COVID-19)!

But for real, this application will have impact **even after** the demise of the Coronovirus. We hope this app can be applied to enable good hygienic practices regarding cleanliness of our surfaces and of our bodies to prevent illness.

We were incredibly rushed in training and testing a classification model, so having TONS more data and having the time to properly create a model would hugely benefit the effectiveness of our gesture detection classification. And as always, the UI can always be improved or tweaked.
