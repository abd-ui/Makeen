import openai

openai.api_key = "YOUR API KEY HERE"

user_input = input()

while user_input != '':

    response = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": user_input},
        ]
    )

    message = response.choices[0]['message']
    print("{}: {}".format(message['role'], message['content']))

    user_input = input()
