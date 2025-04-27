# Use official Ruby image as the base
FROM ruby:3.1.3

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory
WORKDIR /backend

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the Rails application
COPY . .

# Expose port
EXPOSE 3000

# Command to run the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
