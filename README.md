# Authenticate Your Rails API with JWT

This is the Rails API for my Hashnode blog post with the above title

Find the blog post on Hashnode: [https://itsnedum.hashnode.dev/authenticate-your-rails-api-with-jwt](https://itsnedum.hashnode.dev/authenticate-your-rails-api-with-jwt) 

## Features

### User
- Create user
- Login user

### Post
- Create post
- Read post
- Update post
- Delete post

### Authentication
All the post routes was authenticated

## Installation

Clone repo to your local machine:

```git
git clone https://github.com/its-nedum/rails-jwt-authentication.git
```

### Install dependencies and run locally

install GemFile
```
    bundle install
```

Create Users and Posts table
```
    rails db:migrate
```

Now start the rails server:

```
    rails s
```

## API Routes
<table>
	<tr>
		<th>HTTP VERB</th>
		<th>ENDPOINT</th>
		<th>FUNCTIONALITY</th>
	</tr>
    <tr>
        <td>POST</td>
        <td>/api/v1/users</td>
        <td>Create user account</td>
    </tr>
    <tr>
        <td>POST</td>
        <td>/api/v1/login</td>
        <td>Login a user</td>
    </tr>
    <tr>
        <td>GET</td>
        <td>/api/v1/posts</td>
        <td>Return all blog posts</td>
    </tr>
    <tr>
        <td>POST</td>
        <td>/api/v1/posts</td>
        <td>Create a blog post</td>
    </tr>
    <tr>
        <td>GET</td>
        <td>/api/v1/posts/:id</td>
        <td>Return a single post</td>
    </tr>
    <tr>
        <td>PATCH / PUT</td>
        <td>/api/v1/posts/:id</td>
        <td>Update a blog post</td>
    </tr>
    <tr>
        <td>DELETE</td>
        <td>/api/v1/posts/:id</td>
        <td>Delete a blog post</td>
    </tr>
</table>