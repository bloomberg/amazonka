{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.SQS.ChangeMessageVisibilityBatch
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Changes the visibility timeout of multiple messages. This is a batch
-- version of ChangeMessageVisibility. The result of the action on each
-- message is reported individually in the response. You can send up to 10
-- ChangeMessageVisibility requests with each
-- @ChangeMessageVisibilityBatch@ action.
--
-- Because the batch request can result in a combination of successful and
-- unsuccessful actions, you should check for batch errors even when the
-- call returns an HTTP status code of 200.
--
-- Some API actions take lists of parameters. These lists are specified
-- using the @param.n@ notation. Values of @n@ are integers starting from
-- 1. For example, a parameter list with two elements looks like this:
--
-- @&Attribute.1=this@
--
-- @&Attribute.2=that@
--
-- <http://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_ChangeMessageVisibilityBatch.html>
module Network.AWS.SQS.ChangeMessageVisibilityBatch
    (
    -- * Request
      ChangeMessageVisibilityBatch
    -- ** Request constructor
    , changeMessageVisibilityBatch
    -- ** Request lenses
    , cmvbQueueURL
    , cmvbEntries

    -- * Response
    , ChangeMessageVisibilityBatchResponse
    -- ** Response constructor
    , changeMessageVisibilityBatchResponse
    -- ** Response lenses
    , cmvbrStatus
    , cmvbrSuccessful
    , cmvbrFailed
    ) where

import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.SQS.Types

-- | /See:/ 'changeMessageVisibilityBatch' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cmvbQueueURL'
--
-- * 'cmvbEntries'
data ChangeMessageVisibilityBatch = ChangeMessageVisibilityBatch'
    { _cmvbQueueURL :: !Text
    , _cmvbEntries  :: ![ChangeMessageVisibilityBatchRequestEntry]
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ChangeMessageVisibilityBatch' smart constructor.
changeMessageVisibilityBatch :: Text -> ChangeMessageVisibilityBatch
changeMessageVisibilityBatch pQueueURL =
    ChangeMessageVisibilityBatch'
    { _cmvbQueueURL = pQueueURL
    , _cmvbEntries = mempty
    }

-- | The URL of the Amazon SQS queue to take action on.
cmvbQueueURL :: Lens' ChangeMessageVisibilityBatch Text
cmvbQueueURL = lens _cmvbQueueURL (\ s a -> s{_cmvbQueueURL = a});

-- | A list of receipt handles of the messages for which the visibility
-- timeout must be changed.
cmvbEntries :: Lens' ChangeMessageVisibilityBatch [ChangeMessageVisibilityBatchRequestEntry]
cmvbEntries = lens _cmvbEntries (\ s a -> s{_cmvbEntries = a});

instance AWSRequest ChangeMessageVisibilityBatch
         where
        type Sv ChangeMessageVisibilityBatch = SQS
        type Rs ChangeMessageVisibilityBatch =
             ChangeMessageVisibilityBatchResponse
        request = post
        response
          = receiveXMLWrapper
              "ChangeMessageVisibilityBatchResult"
              (\ s h x ->
                 ChangeMessageVisibilityBatchResponse' <$>
                   (pure (fromEnum s)) <*>
                     (parseXMLList
                        "ChangeMessageVisibilityBatchResultEntry"
                        x)
                     <*> (parseXMLList "BatchResultErrorEntry" x))

instance ToHeaders ChangeMessageVisibilityBatch where
        toHeaders = const mempty

instance ToPath ChangeMessageVisibilityBatch where
        toPath = const "/"

instance ToQuery ChangeMessageVisibilityBatch where
        toQuery ChangeMessageVisibilityBatch'{..}
          = mconcat
              ["Action" =:
                 ("ChangeMessageVisibilityBatch" :: ByteString),
               "Version" =: ("2012-11-05" :: ByteString),
               "QueueUrl" =: _cmvbQueueURL,
               toQueryList
                 "ChangeMessageVisibilityBatchRequestEntry"
                 _cmvbEntries]

-- | For each message in the batch, the response contains a
-- ChangeMessageVisibilityBatchResultEntry tag if the message succeeds or a
-- BatchResultErrorEntry tag if the message fails.
--
-- /See:/ 'changeMessageVisibilityBatchResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cmvbrStatus'
--
-- * 'cmvbrSuccessful'
--
-- * 'cmvbrFailed'
data ChangeMessageVisibilityBatchResponse = ChangeMessageVisibilityBatchResponse'
    { _cmvbrStatus     :: !Int
    , _cmvbrSuccessful :: ![ChangeMessageVisibilityBatchResultEntry]
    , _cmvbrFailed     :: ![BatchResultErrorEntry]
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ChangeMessageVisibilityBatchResponse' smart constructor.
changeMessageVisibilityBatchResponse :: Int -> ChangeMessageVisibilityBatchResponse
changeMessageVisibilityBatchResponse pStatus =
    ChangeMessageVisibilityBatchResponse'
    { _cmvbrStatus = pStatus
    , _cmvbrSuccessful = mempty
    , _cmvbrFailed = mempty
    }

-- | FIXME: Undocumented member.
cmvbrStatus :: Lens' ChangeMessageVisibilityBatchResponse Int
cmvbrStatus = lens _cmvbrStatus (\ s a -> s{_cmvbrStatus = a});

-- | A list of ChangeMessageVisibilityBatchResultEntry items.
cmvbrSuccessful :: Lens' ChangeMessageVisibilityBatchResponse [ChangeMessageVisibilityBatchResultEntry]
cmvbrSuccessful = lens _cmvbrSuccessful (\ s a -> s{_cmvbrSuccessful = a});

-- | A list of BatchResultErrorEntry items.
cmvbrFailed :: Lens' ChangeMessageVisibilityBatchResponse [BatchResultErrorEntry]
cmvbrFailed = lens _cmvbrFailed (\ s a -> s{_cmvbrFailed = a});
