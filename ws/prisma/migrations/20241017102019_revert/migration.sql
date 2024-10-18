/*
  Warnings:

  - The primary key for the `CurrentStream` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `CurrentStream` table. All the data in the column will be lost.
  - You are about to drop the column `spaceId` on the `CurrentStream` table. All the data in the column will be lost.
  - You are about to drop the column `spaceId` on the `Stream` table. All the data in the column will be lost.
  - You are about to drop the `Space` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "CurrentStream" DROP CONSTRAINT "CurrentStream_spaceId_fkey";

-- DropForeignKey
ALTER TABLE "Space" DROP CONSTRAINT "Space_hostId_fkey";

-- DropForeignKey
ALTER TABLE "Stream" DROP CONSTRAINT "Stream_spaceId_fkey";

-- DropIndex
DROP INDEX "CurrentStream_spaceId_key";

-- AlterTable
ALTER TABLE "CurrentStream" DROP CONSTRAINT "CurrentStream_pkey",
DROP COLUMN "id",
DROP COLUMN "spaceId",
ADD CONSTRAINT "CurrentStream_pkey" PRIMARY KEY ("userId");

-- AlterTable
ALTER TABLE "Stream" DROP COLUMN "spaceId";

-- DropTable
DROP TABLE "Space";
