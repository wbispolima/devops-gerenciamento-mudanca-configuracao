## Unidade 2

- [Manually Deploying Static Site to S3](https://www.youtube.com/watch?v=QkyQ9d0ttpo)
- [Terraform Deploy Static Site to S3](https://www.youtube.com/watch?v=bo0FqGPFRqA)
- [How To Install WSL on Win11](https://www.youtube.com/watch?v=_FoQrSyo7Wc)

Policy json
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::nome-do-seu-bucket/*"
    }
  ]
}
```