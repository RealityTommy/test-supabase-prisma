/*
  Warnings:

  - You are about to drop the column `userId` on the `organization` table. All the data in the column will be lost.
  - You are about to drop the column `socialMediaId` on the `profileSocialMedia` table. All the data in the column will be lost.
  - You are about to drop the `socialMedia` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `socialMedia` to the `profileSocialMedia` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "socialMediaPlatform" AS ENUM ('FACEBOOK', 'X', 'INSTAGRAM', 'LINKEDIN', 'YOUTUBE');

-- CreateEnum
CREATE TYPE "OrganizationRole" AS ENUM ('ADMIN', 'MEMBER');

-- DropForeignKey
ALTER TABLE "organization" DROP CONSTRAINT "organization_userId_fkey";

-- DropForeignKey
ALTER TABLE "profileSocialMedia" DROP CONSTRAINT "profileSocialMedia_socialMediaId_fkey";

-- AlterTable
ALTER TABLE "organization" DROP COLUMN "userId",
ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "profile" ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "profileLink" ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "profileSocialMedia" DROP COLUMN "socialMediaId",
ADD COLUMN     "socialMedia" "socialMediaPlatform" NOT NULL,
ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "user" ALTER COLUMN "createdAt" SET DEFAULT now();

-- DropTable
DROP TABLE "socialMedia";

-- CreateTable
CREATE TABLE "organizationUsers" (
    "organizationId" UUID NOT NULL,
    "userId" UUID NOT NULL,
    "role" "OrganizationRole" NOT NULL DEFAULT 'MEMBER',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT now(),
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "organizationUsers_pkey" PRIMARY KEY ("organizationId","userId")
);

-- AddForeignKey
ALTER TABLE "organizationUsers" ADD CONSTRAINT "organizationUsers_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "organizationUsers" ADD CONSTRAINT "organizationUsers_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
