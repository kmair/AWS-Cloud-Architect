# AWS-Cloud-Architect Nanodegree

This repository contains the work done towards completion of this Nanodegree towards building AWS Cloud Architecture. [Certificate](https://docs.github.com/en/github/writing-on-github/basic-writing-and-formatting-syntax)
for this nanodegree.

A brief preview of the projects worked upon are as follows:

## 1. Design for Availability, Resilience and Reliability

The objective was to design a highhly available website using multi-region RDS database supporting it. 
The EC2 instances were running the following architecture:

![Available](Design%20for%20Availability%2C%20Resilience%20and%20Reliability/screenshots/Highly%20available%20architecture.PNG)

A versioned website was configured to revert back in case of service disruptions.

## 2. Design for Performance and Scalability

In this project, the entire AWS infrastructure is planned, provisioned, and monitored using industry-standard open source tools needed to setup a small social media company. 
A brief overview of 3 plans based on budget availability are:

| Scenario | Estimates / Limit <br />  ($/month) | Cost Narrative |
| --- | --- | ---|
| Normal | 9,599 / 10,000 | Running storage optimized instances for ~5 million active users |
| Increased | 19,965 / 20,000 | Scaling the database storage and more redundant system for ~20 million users |
| Reduced | 5,955/ 6,000 | Reducing the latency of instance to achieve lesser budget costs |

Terraform was used to deploy Infrastructure as a Code and monitored using CloudWatch.

## 3. Design for Security

The initial AWS infrastructure for a subscription-based website is susceptible to an Attack instance due to insufficient security configurations.
By setting up AWS Config, AWS Inspector, and AWS Security Hub, the source of malpractices was identified.

![Security](Design%20for%20Security/starter/AWS-WebServiceDiagram-v1-insecure.png)

To plug these loopholes, following changes were made:
- Removing SSH with password ability for logging into the system to avoid password break attempts by the attacking instance
- Further hardening achieved by limiting access ports coming only through the Application Load Balancer to the Web Service Instance
- Protecting secrets with file encryption within AWS
- Limiting access to the S3 buckets using key manages services (KMS)
