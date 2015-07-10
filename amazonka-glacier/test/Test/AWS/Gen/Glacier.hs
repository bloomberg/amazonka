{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-orphans        #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Test.AWS.Gen.Glacier
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
module Test.AWS.Gen.Glacier where

import Data.Proxy
import Test.AWS.Fixture
import Test.AWS.Prelude
import Test.Tasty
import Network.AWS.Glacier
import Test.AWS.Glacier.Internal

-- Auto-generated: the actual test selection needs to be manually placed into
-- the top-level so that real test data can be incrementally added.
--
-- This commented snippet is what the entire set should look like:

-- fixtures :: TestTree
-- fixtures =
--     [ testGroup "request"
--         [ testSetVaultAccessPolicy $
--             setVaultAccessPolicy
--
--         , testInitiateJob $
--             initiateJob
--
--         , testSetDataRetrievalPolicy $
--             setDataRetrievalPolicy
--
--         , testDeleteVaultAccessPolicy $
--             deleteVaultAccessPolicy
--
--         , testListTagsForVault $
--             listTagsForVault
--
--         , testGetVaultNotifications $
--             getVaultNotifications
--
--         , testUploadMultipartPart $
--             uploadMultipartPart
--
--         , testDeleteVaultNotifications $
--             deleteVaultNotifications
--
--         , testListVaults $
--             listVaults
--
--         , testGetJobOutput $
--             getJobOutput
--
--         , testListJobs $
--             listJobs
--
--         , testSetVaultNotifications $
--             setVaultNotifications
--
--         , testCompleteMultipartUpload $
--             completeMultipartUpload
--
--         , testListMultipartUploads $
--             listMultipartUploads
--
--         , testDescribeVault $
--             describeVault
--
--         , testAbortMultipartUpload $
--             abortMultipartUpload
--
--         , testDescribeJob $
--             describeJob
--
--         , testGetVaultAccessPolicy $
--             getVaultAccessPolicy
--
--         , testGetDataRetrievalPolicy $
--             getDataRetrievalPolicy
--
--         , testRemoveTagsFromVault $
--             removeTagsFromVault
--
--         , testDeleteArchive $
--             deleteArchive
--
--         , testDeleteVault $
--             deleteVault
--
--         , testInitiateMultipartUpload $
--             initiateMultipartUpload
--
--         , testListParts $
--             listParts
--
--         , testCreateVault $
--             createVault
--
--         , testAddTagsToVault $
--             addTagsToVault
--
--         , testUploadArchive $
--             uploadArchive
--
--           ]

--     , testGroup "response"
--         [ testSetVaultAccessPolicyResponse $
--             setVaultAccessPolicyResponse
--
--         , testInitiateJobResponse $
--             initiateJobResponse
--
--         , testSetDataRetrievalPolicyResponse $
--             setDataRetrievalPolicyResponse
--
--         , testDeleteVaultAccessPolicyResponse $
--             deleteVaultAccessPolicyResponse
--
--         , testListTagsForVaultResponse $
--             listTagsForVaultResponse
--
--         , testGetVaultNotificationsResponse $
--             getVaultNotificationsResponse
--
--         , testUploadMultipartPartResponse $
--             uploadMultipartPartResponse
--
--         , testDeleteVaultNotificationsResponse $
--             deleteVaultNotificationsResponse
--
--         , testListVaultsResponse $
--             listVaultsResponse
--
--         , testGetJobOutputResponse $
--             getJobOutputResponse
--
--         , testListJobsResponse $
--             listJobsResponse
--
--         , testSetVaultNotificationsResponse $
--             setVaultNotificationsResponse
--
--         , testCompleteMultipartUploadResponse $
--             archiveCreationOutput
--
--         , testListMultipartUploadsResponse $
--             listMultipartUploadsResponse
--
--         , testDescribeVaultResponse $
--             describeVaultOutput
--
--         , testAbortMultipartUploadResponse $
--             abortMultipartUploadResponse
--
--         , testDescribeJobResponse $
--             glacierJobDescription
--
--         , testGetVaultAccessPolicyResponse $
--             getVaultAccessPolicyResponse
--
--         , testGetDataRetrievalPolicyResponse $
--             getDataRetrievalPolicyResponse
--
--         , testRemoveTagsFromVaultResponse $
--             removeTagsFromVaultResponse
--
--         , testDeleteArchiveResponse $
--             deleteArchiveResponse
--
--         , testDeleteVaultResponse $
--             deleteVaultResponse
--
--         , testInitiateMultipartUploadResponse $
--             initiateMultipartUploadResponse
--
--         , testListPartsResponse $
--             listPartsResponse
--
--         , testCreateVaultResponse $
--             createVaultResponse
--
--         , testAddTagsToVaultResponse $
--             addTagsToVaultResponse
--
--         , testUploadArchiveResponse $
--             archiveCreationOutput
--
--           ]
--     ]

-- Requests

testSetVaultAccessPolicy :: SetVaultAccessPolicy -> TestTree
testSetVaultAccessPolicy = req
    "SetVaultAccessPolicy"
    "fixture/SetVaultAccessPolicy"

testInitiateJob :: InitiateJob -> TestTree
testInitiateJob = req
    "InitiateJob"
    "fixture/InitiateJob"

testSetDataRetrievalPolicy :: SetDataRetrievalPolicy -> TestTree
testSetDataRetrievalPolicy = req
    "SetDataRetrievalPolicy"
    "fixture/SetDataRetrievalPolicy"

testDeleteVaultAccessPolicy :: DeleteVaultAccessPolicy -> TestTree
testDeleteVaultAccessPolicy = req
    "DeleteVaultAccessPolicy"
    "fixture/DeleteVaultAccessPolicy"

testListTagsForVault :: ListTagsForVault -> TestTree
testListTagsForVault = req
    "ListTagsForVault"
    "fixture/ListTagsForVault"

testGetVaultNotifications :: GetVaultNotifications -> TestTree
testGetVaultNotifications = req
    "GetVaultNotifications"
    "fixture/GetVaultNotifications"

testDeleteVaultNotifications :: DeleteVaultNotifications -> TestTree
testDeleteVaultNotifications = req
    "DeleteVaultNotifications"
    "fixture/DeleteVaultNotifications"

testListVaults :: ListVaults -> TestTree
testListVaults = req
    "ListVaults"
    "fixture/ListVaults"

testGetJobOutput :: GetJobOutput -> TestTree
testGetJobOutput = req
    "GetJobOutput"
    "fixture/GetJobOutput"

testListJobs :: ListJobs -> TestTree
testListJobs = req
    "ListJobs"
    "fixture/ListJobs"

testSetVaultNotifications :: SetVaultNotifications -> TestTree
testSetVaultNotifications = req
    "SetVaultNotifications"
    "fixture/SetVaultNotifications"

testCompleteMultipartUpload :: CompleteMultipartUpload -> TestTree
testCompleteMultipartUpload = req
    "CompleteMultipartUpload"
    "fixture/CompleteMultipartUpload"

testListMultipartUploads :: ListMultipartUploads -> TestTree
testListMultipartUploads = req
    "ListMultipartUploads"
    "fixture/ListMultipartUploads"

testDescribeVault :: DescribeVault -> TestTree
testDescribeVault = req
    "DescribeVault"
    "fixture/DescribeVault"

testAbortMultipartUpload :: AbortMultipartUpload -> TestTree
testAbortMultipartUpload = req
    "AbortMultipartUpload"
    "fixture/AbortMultipartUpload"

testDescribeJob :: DescribeJob -> TestTree
testDescribeJob = req
    "DescribeJob"
    "fixture/DescribeJob"

testGetVaultAccessPolicy :: GetVaultAccessPolicy -> TestTree
testGetVaultAccessPolicy = req
    "GetVaultAccessPolicy"
    "fixture/GetVaultAccessPolicy"

testGetDataRetrievalPolicy :: GetDataRetrievalPolicy -> TestTree
testGetDataRetrievalPolicy = req
    "GetDataRetrievalPolicy"
    "fixture/GetDataRetrievalPolicy"

testRemoveTagsFromVault :: RemoveTagsFromVault -> TestTree
testRemoveTagsFromVault = req
    "RemoveTagsFromVault"
    "fixture/RemoveTagsFromVault"

testDeleteArchive :: DeleteArchive -> TestTree
testDeleteArchive = req
    "DeleteArchive"
    "fixture/DeleteArchive"

testDeleteVault :: DeleteVault -> TestTree
testDeleteVault = req
    "DeleteVault"
    "fixture/DeleteVault"

testInitiateMultipartUpload :: InitiateMultipartUpload -> TestTree
testInitiateMultipartUpload = req
    "InitiateMultipartUpload"
    "fixture/InitiateMultipartUpload"

testListParts :: ListParts -> TestTree
testListParts = req
    "ListParts"
    "fixture/ListParts"

testCreateVault :: CreateVault -> TestTree
testCreateVault = req
    "CreateVault"
    "fixture/CreateVault"

testAddTagsToVault :: AddTagsToVault -> TestTree
testAddTagsToVault = req
    "AddTagsToVault"
    "fixture/AddTagsToVault"

-- Responses

testSetVaultAccessPolicyResponse :: SetVaultAccessPolicyResponse -> TestTree
testSetVaultAccessPolicyResponse = res
    "SetVaultAccessPolicyResponse"
    "fixture/SetVaultAccessPolicyResponse"
    (Proxy :: Proxy SetVaultAccessPolicy)

testInitiateJobResponse :: InitiateJobResponse -> TestTree
testInitiateJobResponse = res
    "InitiateJobResponse"
    "fixture/InitiateJobResponse"
    (Proxy :: Proxy InitiateJob)

testSetDataRetrievalPolicyResponse :: SetDataRetrievalPolicyResponse -> TestTree
testSetDataRetrievalPolicyResponse = res
    "SetDataRetrievalPolicyResponse"
    "fixture/SetDataRetrievalPolicyResponse"
    (Proxy :: Proxy SetDataRetrievalPolicy)

testDeleteVaultAccessPolicyResponse :: DeleteVaultAccessPolicyResponse -> TestTree
testDeleteVaultAccessPolicyResponse = res
    "DeleteVaultAccessPolicyResponse"
    "fixture/DeleteVaultAccessPolicyResponse"
    (Proxy :: Proxy DeleteVaultAccessPolicy)

testListTagsForVaultResponse :: ListTagsForVaultResponse -> TestTree
testListTagsForVaultResponse = res
    "ListTagsForVaultResponse"
    "fixture/ListTagsForVaultResponse"
    (Proxy :: Proxy ListTagsForVault)

testGetVaultNotificationsResponse :: GetVaultNotificationsResponse -> TestTree
testGetVaultNotificationsResponse = res
    "GetVaultNotificationsResponse"
    "fixture/GetVaultNotificationsResponse"
    (Proxy :: Proxy GetVaultNotifications)

testUploadMultipartPartResponse :: UploadMultipartPartResponse -> TestTree
testUploadMultipartPartResponse = res
    "UploadMultipartPartResponse"
    "fixture/UploadMultipartPartResponse"
    (Proxy :: Proxy UploadMultipartPart)

testDeleteVaultNotificationsResponse :: DeleteVaultNotificationsResponse -> TestTree
testDeleteVaultNotificationsResponse = res
    "DeleteVaultNotificationsResponse"
    "fixture/DeleteVaultNotificationsResponse"
    (Proxy :: Proxy DeleteVaultNotifications)

testListVaultsResponse :: ListVaultsResponse -> TestTree
testListVaultsResponse = res
    "ListVaultsResponse"
    "fixture/ListVaultsResponse"
    (Proxy :: Proxy ListVaults)

testListJobsResponse :: ListJobsResponse -> TestTree
testListJobsResponse = res
    "ListJobsResponse"
    "fixture/ListJobsResponse"
    (Proxy :: Proxy ListJobs)

testSetVaultNotificationsResponse :: SetVaultNotificationsResponse -> TestTree
testSetVaultNotificationsResponse = res
    "SetVaultNotificationsResponse"
    "fixture/SetVaultNotificationsResponse"
    (Proxy :: Proxy SetVaultNotifications)

testCompleteMultipartUploadResponse :: ArchiveCreationOutput -> TestTree
testCompleteMultipartUploadResponse = res
    "CompleteMultipartUploadResponse"
    "fixture/CompleteMultipartUploadResponse"
    (Proxy :: Proxy CompleteMultipartUpload)

testListMultipartUploadsResponse :: ListMultipartUploadsResponse -> TestTree
testListMultipartUploadsResponse = res
    "ListMultipartUploadsResponse"
    "fixture/ListMultipartUploadsResponse"
    (Proxy :: Proxy ListMultipartUploads)

testDescribeVaultResponse :: DescribeVaultOutput -> TestTree
testDescribeVaultResponse = res
    "DescribeVaultResponse"
    "fixture/DescribeVaultResponse"
    (Proxy :: Proxy DescribeVault)

testAbortMultipartUploadResponse :: AbortMultipartUploadResponse -> TestTree
testAbortMultipartUploadResponse = res
    "AbortMultipartUploadResponse"
    "fixture/AbortMultipartUploadResponse"
    (Proxy :: Proxy AbortMultipartUpload)

testDescribeJobResponse :: GlacierJobDescription -> TestTree
testDescribeJobResponse = res
    "DescribeJobResponse"
    "fixture/DescribeJobResponse"
    (Proxy :: Proxy DescribeJob)

testGetVaultAccessPolicyResponse :: GetVaultAccessPolicyResponse -> TestTree
testGetVaultAccessPolicyResponse = res
    "GetVaultAccessPolicyResponse"
    "fixture/GetVaultAccessPolicyResponse"
    (Proxy :: Proxy GetVaultAccessPolicy)

testGetDataRetrievalPolicyResponse :: GetDataRetrievalPolicyResponse -> TestTree
testGetDataRetrievalPolicyResponse = res
    "GetDataRetrievalPolicyResponse"
    "fixture/GetDataRetrievalPolicyResponse"
    (Proxy :: Proxy GetDataRetrievalPolicy)

testRemoveTagsFromVaultResponse :: RemoveTagsFromVaultResponse -> TestTree
testRemoveTagsFromVaultResponse = res
    "RemoveTagsFromVaultResponse"
    "fixture/RemoveTagsFromVaultResponse"
    (Proxy :: Proxy RemoveTagsFromVault)

testDeleteArchiveResponse :: DeleteArchiveResponse -> TestTree
testDeleteArchiveResponse = res
    "DeleteArchiveResponse"
    "fixture/DeleteArchiveResponse"
    (Proxy :: Proxy DeleteArchive)

testDeleteVaultResponse :: DeleteVaultResponse -> TestTree
testDeleteVaultResponse = res
    "DeleteVaultResponse"
    "fixture/DeleteVaultResponse"
    (Proxy :: Proxy DeleteVault)

testInitiateMultipartUploadResponse :: InitiateMultipartUploadResponse -> TestTree
testInitiateMultipartUploadResponse = res
    "InitiateMultipartUploadResponse"
    "fixture/InitiateMultipartUploadResponse"
    (Proxy :: Proxy InitiateMultipartUpload)

testListPartsResponse :: ListPartsResponse -> TestTree
testListPartsResponse = res
    "ListPartsResponse"
    "fixture/ListPartsResponse"
    (Proxy :: Proxy ListParts)

testCreateVaultResponse :: CreateVaultResponse -> TestTree
testCreateVaultResponse = res
    "CreateVaultResponse"
    "fixture/CreateVaultResponse"
    (Proxy :: Proxy CreateVault)

testAddTagsToVaultResponse :: AddTagsToVaultResponse -> TestTree
testAddTagsToVaultResponse = res
    "AddTagsToVaultResponse"
    "fixture/AddTagsToVaultResponse"
    (Proxy :: Proxy AddTagsToVault)

testUploadArchiveResponse :: ArchiveCreationOutput -> TestTree
testUploadArchiveResponse = res
    "UploadArchiveResponse"
    "fixture/UploadArchiveResponse"
    (Proxy :: Proxy UploadArchive)

instance Out AbortMultipartUpload
instance Out AbortMultipartUploadResponse
instance Out ActionCode
instance Out AddTagsToVault
instance Out AddTagsToVaultResponse
instance Out ArchiveCreationOutput
instance Out CompleteMultipartUpload
instance Out CreateVault
instance Out CreateVaultResponse
instance Out DataRetrievalPolicy
instance Out DataRetrievalRule
instance Out DeleteArchive
instance Out DeleteArchiveResponse
instance Out DeleteVault
instance Out DeleteVaultAccessPolicy
instance Out DeleteVaultAccessPolicyResponse
instance Out DeleteVaultNotifications
instance Out DeleteVaultNotificationsResponse
instance Out DeleteVaultResponse
instance Out DescribeJob
instance Out DescribeVault
instance Out DescribeVaultOutput
instance Out GetDataRetrievalPolicy
instance Out GetDataRetrievalPolicyResponse
instance Out GetJobOutput
instance Out GetJobOutputResponse
instance Out GetVaultAccessPolicy
instance Out GetVaultAccessPolicyResponse
instance Out GetVaultNotifications
instance Out GetVaultNotificationsResponse
instance Out GlacierJobDescription
instance Out InitiateJob
instance Out InitiateJobResponse
instance Out InitiateMultipartUpload
instance Out InitiateMultipartUploadResponse
instance Out InventoryRetrievalJobDescription
instance Out InventoryRetrievalJobInput
instance Out JobParameters
instance Out ListJobs
instance Out ListJobsResponse
instance Out ListMultipartUploads
instance Out ListMultipartUploadsResponse
instance Out ListParts
instance Out ListPartsResponse
instance Out ListTagsForVault
instance Out ListTagsForVaultResponse
instance Out ListVaults
instance Out ListVaultsResponse
instance Out PartListElement
instance Out RemoveTagsFromVault
instance Out RemoveTagsFromVaultResponse
instance Out SetDataRetrievalPolicy
instance Out SetDataRetrievalPolicyResponse
instance Out SetVaultAccessPolicy
instance Out SetVaultAccessPolicyResponse
instance Out SetVaultNotifications
instance Out SetVaultNotificationsResponse
instance Out StatusCode
instance Out UploadArchive
instance Out UploadListElement
instance Out UploadMultipartPart
instance Out UploadMultipartPartResponse
instance Out VaultAccessPolicy
instance Out VaultNotificationConfig
