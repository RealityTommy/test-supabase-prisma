/*
  Warnings:

  - A unique constraint covering the columns `[name]` on the table `organization` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `name` to the `organization` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "profile" DROP CONSTRAINT "profile_userId_fkey";

-- AlterTable
ALTER TABLE "organization" ADD COLUMN     "name" TEXT NOT NULL,
ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "profile" ALTER COLUMN "userId" DROP NOT NULL,
ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "profileLink" ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "profileSocialMedia" ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "socialMedia" ALTER COLUMN "createdAt" SET DEFAULT now();

-- AlterTable
ALTER TABLE "user" ALTER COLUMN "createdAt" SET DEFAULT now();

-- CreateIndex
CREATE UNIQUE INDEX "organization_name_key" ON "organization"("name");

-- AddForeignKey
ALTER TABLE "profile" ADD CONSTRAINT "profile_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;
