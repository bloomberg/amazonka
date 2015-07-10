{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.MachineLearning.DeleteEvaluation
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Assigns the @DELETED@ status to an @Evaluation@, rendering it unusable.
--
-- After invoking the @DeleteEvaluation@ operation, you can use the
-- GetEvaluation operation to verify that the status of the @Evaluation@
-- changed to @DELETED@.
--
-- Caution
--
-- The results of the @DeleteEvaluation@ operation are irreversible.
--
-- <http://http://docs.aws.amazon.com/machine-learning/latest/APIReference/API_DeleteEvaluation.html>
module Network.AWS.MachineLearning.DeleteEvaluation
    (
    -- * Request
      DeleteEvaluation
    -- ** Request constructor
    , deleteEvaluation
    -- ** Request lenses
    , deEvaluationId

    -- * Response
    , DeleteEvaluationResponse
    -- ** Response constructor
    , deleteEvaluationResponse
    -- ** Response lenses
    , derEvaluationId
    , derStatus
    ) where

import           Network.AWS.MachineLearning.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'deleteEvaluation' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'deEvaluationId'
newtype DeleteEvaluation = DeleteEvaluation'
    { _deEvaluationId :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteEvaluation' smart constructor.
deleteEvaluation :: Text -> DeleteEvaluation
deleteEvaluation pEvaluationId =
    DeleteEvaluation'
    { _deEvaluationId = pEvaluationId
    }

-- | A user-supplied ID that uniquely identifies the @Evaluation@ to delete.
deEvaluationId :: Lens' DeleteEvaluation Text
deEvaluationId = lens _deEvaluationId (\ s a -> s{_deEvaluationId = a});

instance AWSRequest DeleteEvaluation where
        type Sv DeleteEvaluation = MachineLearning
        type Rs DeleteEvaluation = DeleteEvaluationResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 DeleteEvaluationResponse' <$>
                   (x .?> "EvaluationId") <*> (pure (fromEnum s)))

instance ToHeaders DeleteEvaluation where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AmazonML_20141212.DeleteEvaluation" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DeleteEvaluation where
        toJSON DeleteEvaluation'{..}
          = object ["EvaluationId" .= _deEvaluationId]

instance ToPath DeleteEvaluation where
        toPath = const "/"

instance ToQuery DeleteEvaluation where
        toQuery = const mempty

-- | Represents the output of a DeleteEvaluation operation. The output
-- indicates that Amazon Machine Learning (Amazon ML) received the request.
--
-- You can use the GetEvaluation operation and check the value of the
-- @Status@ parameter to see whether an @Evaluation@ is marked as
-- @DELETED@.
--
-- /See:/ 'deleteEvaluationResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'derEvaluationId'
--
-- * 'derStatus'
data DeleteEvaluationResponse = DeleteEvaluationResponse'
    { _derEvaluationId :: !(Maybe Text)
    , _derStatus       :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteEvaluationResponse' smart constructor.
deleteEvaluationResponse :: Int -> DeleteEvaluationResponse
deleteEvaluationResponse pStatus =
    DeleteEvaluationResponse'
    { _derEvaluationId = Nothing
    , _derStatus = pStatus
    }

-- | A user-supplied ID that uniquely identifies the @Evaluation@. This value
-- should be identical to the value of the @EvaluationId@ in the request.
derEvaluationId :: Lens' DeleteEvaluationResponse (Maybe Text)
derEvaluationId = lens _derEvaluationId (\ s a -> s{_derEvaluationId = a});

-- | FIXME: Undocumented member.
derStatus :: Lens' DeleteEvaluationResponse Int
derStatus = lens _derStatus (\ s a -> s{_derStatus = a});
