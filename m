Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9835A11EA9E
	for <lists+linux-ide@lfdr.de>; Fri, 13 Dec 2019 19:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbfLMSqj (ORCPT <rfc822;lists+linux-ide@lfdr.de>);
        Fri, 13 Dec 2019 13:46:39 -0500
Received: from delivery.mailspamprotection.com ([108.178.14.83]:50369 "EHLO
        delivery.mailspamprotection.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728455AbfLMSqj (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 13 Dec 2019 13:46:39 -0500
X-Greylist: delayed 2664 seconds by postgrey-1.27 at vger.kernel.org; Fri, 13 Dec 2019 13:46:38 EST
Received: from ns1.sgp65.siteground.asia ([77.104.150.195] helo=sgp65.siteground.asia)
        by se14.mailspamprotection.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.89)
        (envelope-from <fantasie@fantasiechocolate.com>)
        id 1ifpFv-0006wg-1R; Fri, 13 Dec 2019 12:01:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=fantasiechocolate.com; s=default; h=Reply-To:Date:From:To:Subject:
        Content-Description:Content-Transfer-Encoding:MIME-Version:Content-Type:
        Sender:Message-ID:Cc:Content-ID:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=G9LTS5QPxJ/s89LVw4V0N76a9Lg4GJG1FaRG84gTZKM=; b=PU9n53dn6xnvj6hTLbPhoRuBK
        L1uaYzWBBc6XGonj+vuITsY1E2cMW1wlvqPhIQpT9MrTzMIGqin0hLlRJk+i6TAiEqM3Ko4TYpGKP
        jaxQIb1ddF0kG24QIQd1V87Uf5sygd8xhlaCJi5S06lW6Yg0ldPQolHiyT+E0UDT5cnFcbjnyhyUB
        VV2q6Pr/od4KqQ9wVhN8+oHUG+b1CQ5fXqlhPzIa4YBi4HL6YUXvaRhHVK7TDrLrK3uKwifMqQuOa
        sYbMKYQ/N1d/x/UwZ5P4ui+4joxmBaGhOI5CcYpJPAFScUCAyhiB4lzjinFVPX7sGChhsNb7TbNLy
        xbGLai/kA==;
Received: from [102.176.94.220] (port=15804 helo=[172.20.10.3])
        by sgp65.siteground.asia with esmtpa (Exim 4.90devstart-1178-b07e68e5-XX)
        (envelope-from <fantasie@fantasiechocolate.com>)
        id 1ifpFg-00093O-Ms; Sat, 14 Dec 2019 02:01:21 +0800
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Hello
To:     Recipients <fantasie@fantasiechocolate.com>
From:   fantasie@fantasiechocolate.com
Date:   Fri, 13 Dec 2019 13:00:55 -0500
Reply-To: jackharg231@gmail.com
Message-ID: <E1ifpFv-0006wg-1R@se14.mailspamprotection.com>
X-Originating-IP: 77.104.150.195
X-SpamExperts-Domain: sgp65.siteground.asia
X-SpamExperts-Username: 77.104.150.195
Authentication-Results: mailspamprotection.com; auth=pass smtp.auth=77.104.150.195@sgp65.siteground.asia
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.62)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0fi3oD8HEy9ysrsB6Ile+oipSDasLI4SayDByyq9LIhVCyrmJ3kErhdd
 dDJXbiJod0TNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Kbsmvic//qkdCg4YQ1EOZJU0b
 m2Vs8lp6Ltti+zkSTYDgPTWObFa7YslzpSNpUGa1QgdghT3V3g39hraLtZpSu81Cdn6Ge6I3YOOc
 BTWdCeGijG0vyfmzuS2MaFxt8TVQxBPxP5MIJLaXEnP8Oh1rj1R50Hwi0jSpsHI8yPwk1hzGGGqU
 ZHwRFsB6UphG9U+tc+/LwNeyjhkfReUAckJ+uAxtH3wAENB/p3ciBgmjHnvI6xQgDpO904QCY1GJ
 ABWtupOGzx+JbolqmkmJXvGVO16kuEq4w4oPOlzQkL/9/GEbASgABhcVavbcAlVmQ2du9onpbnRo
 dsEH5DZFv3DyAzdj14xsey0SIUeY/+ddD0zbfunJS9NvkK04oxObYrKI8FxsYuxhfRzQ5VH628rr
 6IW2I4zEPMuiSuvFrM1bJwN1YTgZtjV4ikFWjOlqn0bLPpj8r086OAOWUBrvL/WXeAIMgOe4/JwF
 4IDlJ+WD/WbVt2rHnbBI0sIUuW6sZkN91fXTkWQyshxjRcN4+zJIlpVf4XvvIYVxOaW23G08e98n
 whjLAl5gZodq0vatfKLHtnybTyKrTZVrkvHDtf64bU5HjXfq8Dq/j486Z0ZLpdKneMYDGT6hn0vI
 aWX42GbP4pWx7WxWFZpsjT/483ewgqLtc57fIcJnEbAve+sBiNEuZ776uHuZaALzAKY8BmR1kxi2
 g6kxhuc2EktXlSJddD8oNaouPGKvCov2uG7Gcjmfo3WbKyndbaAXHRODL5SDsp2u/+Dor0gguhZc
 Vyh35AwST00sKDcxYj/V81q9oVEr2nytUYxMngtYaooH5wDil6A2JR8e7s09wKwcRRZyPBlIhyIs
 EO3nDKwoHYW6uc9X3a05KLcLvKLHVizvWNfXpzTLE0j6il5LJswaOfpinGCeXmRn9Bs4p5o2/vTW
 SLh0EyffDL1eqtO7MxQcPAt28SXgSKBhU2SAtu8rdl3T5nDV503tb5Yzr2zAVT9oT7CxbWpaFlTz
 4fKoJ4hy/82Mp79j1FeutA7Gcl5hh4JjUPaispoNDgHhhjQafiMSAtZUI1t4mPoirRq4PJLWMw/6
 u2Ylqn7Fhx2DesNipid2KmeupYYdzPm7YfRDaULOU2kSzA1RvvIYdFmEgFEj1BLEJPsIAWNjz330
 68FBFeRefBBfiQ4ZAefQocRcwwv7gDJoh9VoIekQHpwUfpYnEThmFOgj6ohsNCvC5sfKhVYnsopJ
 XBK0avC8WTx5euW4laAxydn+Mn8HbNlYxrNexU3jSimAdm9/aEzbAV2KT6q3/jJMQy/NGJHkj5bD
 fhM7JgqmVy5P4rlJMBNgdRj/iv9Ks+Ni4CSGnhkJrsChVZh65EKIAb/lSF12rMho20vyySQdBClO
 coeTn7FQCagMhkigxULjm/6tQW5c1FU+/XULWF4CkRgJJTVI8/xDiEltcPxm4zuNRcgRKiGg7nXF
 aZTxI7Bgdq+6SuieN3pD1wL9J/bvtt9gMqA840b3L3duhIUyXMwCAQyKUpS7RCiEjsXBYdrEyuY2
 1y29NxmIP/touLt18Tw4bpXTQOmA8eFR19JC7QRLX/i7u4mwMmVmrGeVFyrtVW4KaRSURqFyxA+5
 h/2gsiOf6MoaHs3iCcty/nBXwfRWuTAmUhnGz/vdX7KJkOsE7FOEPEyP2U5MMW/eyw==
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Sender: linux-ide-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Are you available?


Regards
Jack Hargreaves
Broker/Financial consortium
