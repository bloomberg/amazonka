{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.ECS.DeleteCluster
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Deletes the specified cluster. You must deregister all container
-- instances from this cluster before you may delete it. You can list the
-- container instances in a cluster with ListContainerInstances and
-- deregister them with DeregisterContainerInstance.
--
-- <http://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DeleteCluster.html>
module Network.AWS.ECS.DeleteCluster
    (
    -- * Request
      DeleteCluster
    -- ** Request constructor
    , deleteCluster
    -- ** Request lenses
    , dcCluster

    -- * Response
    , DeleteClusterResponse
    -- ** Response constructor
    , deleteClusterResponse
    -- ** Response lenses
    , delCluster
    , delStatus
    ) where

import           Network.AWS.ECS.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'deleteCluster' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dcCluster'
newtype DeleteCluster = DeleteCluster'
    { _dcCluster :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteCluster' smart constructor.
deleteCluster :: Text -> DeleteCluster
deleteCluster pCluster =
    DeleteCluster'
    { _dcCluster = pCluster
    }

-- | The short name or full Amazon Resource Name (ARN) of the cluster that
-- you want to delete.
dcCluster :: Lens' DeleteCluster Text
dcCluster = lens _dcCluster (\ s a -> s{_dcCluster = a});

instance AWSRequest DeleteCluster where
        type Sv DeleteCluster = ECS
        type Rs DeleteCluster = DeleteClusterResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 DeleteClusterResponse' <$>
                   (x .?> "cluster") <*> (pure (fromEnum s)))

instance ToHeaders DeleteCluster where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AmazonEC2ContainerServiceV20141113.DeleteCluster"
                       :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DeleteCluster where
        toJSON DeleteCluster'{..}
          = object ["cluster" .= _dcCluster]

instance ToPath DeleteCluster where
        toPath = const "/"

instance ToQuery DeleteCluster where
        toQuery = const mempty

-- | /See:/ 'deleteClusterResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'delCluster'
--
-- * 'delStatus'
data DeleteClusterResponse = DeleteClusterResponse'
    { _delCluster :: !(Maybe Cluster)
    , _delStatus  :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteClusterResponse' smart constructor.
deleteClusterResponse :: Int -> DeleteClusterResponse
deleteClusterResponse pStatus =
    DeleteClusterResponse'
    { _delCluster = Nothing
    , _delStatus = pStatus
    }

-- | The full description of the deleted cluster.
delCluster :: Lens' DeleteClusterResponse (Maybe Cluster)
delCluster = lens _delCluster (\ s a -> s{_delCluster = a});

-- | FIXME: Undocumented member.
delStatus :: Lens' DeleteClusterResponse Int
delStatus = lens _delStatus (\ s a -> s{_delStatus = a});
