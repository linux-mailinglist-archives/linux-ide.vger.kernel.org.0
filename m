Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C08F1A7501
	for <lists+linux-ide@lfdr.de>; Tue, 14 Apr 2020 09:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406799AbgDNHme (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Tue, 14 Apr 2020 03:42:34 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37148 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729368AbgDNHm3 (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Tue, 14 Apr 2020 03:42:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=JJ5p+3/4IGSnlDpePvLUhJym9cud2qctPPEa9hKpgOM=; b=mZGEHRFvMVjixYpNm3y0zpmQjV
        IC9wydu/Xq4lMZvgsrmgMxNkFERUCAjs3f8J0/5wVTNywoZV3uCEIT8qAAtKV0YO94ZgF2FK51m1H
        vajT4cliScjbIguGiXn2RA8fC+zCjbCIYKn12IP9YpSPdMocRBFokH08fC7Sfko8e0stwbptBPv+e
        oouFi+80pNZ7tRxPc2lL+SqmxxShS7ZjVQEGdJg/UPhgnHiYCFbAHvkxLFBh160Yh+srwNXcV1Szw
        lX6vVL3wX1vFWmyhgEB2vCiFI6oXcr6R6Y1BByOGu5shaghfjpinuSyxHNWHysEQHvA50d/TYeVTV
        l7cg2/xw==;
Received: from [2001:4bb8:180:384b:4c21:af7:dd95:e552] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jOGDD-00073b-R8; Tue, 14 Apr 2020 07:42:28 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: clean up DMA draining
Date:   Tue, 14 Apr 2020 09:42:20 +0200
Message-Id: <20200414074225.332324-1-hch@lst.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hi all,

currently the dma draining and alignining specific to ATA CDROMs
and the UFS driver has its ugly hooks in core block code.  Move
this out into the scsi and ide drivers instead.
