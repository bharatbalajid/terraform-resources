resource "aws_iam_user" "myuser" {
  for_each = toset(["jai", "aravind"])
  name     = each.key
}
resource "aws_iam_policy" "mypolicy" {
  name = "test-policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "*",
        Effect   = "Allow",
        Resource = "*"
      },
    ]
  })
}
resource "aws_iam_policy_attachment" "myat" {
  
}