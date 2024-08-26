/*
  Warnings:

  - Added the required column `userId` to the `organization` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "organization" ADD COLUMN     "userId" UUID NOT NULL,
ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "profile" ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "profileLink" ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "profileSocialMedia" ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "socialMedia" ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "user" ALTER COLUMN "createdAt" SET DEFAULT now();

-- AddForeignKey
ALTER TABLE "organization" ADD CONSTRAINT "organization_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
