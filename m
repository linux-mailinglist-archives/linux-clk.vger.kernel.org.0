Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A524A393C8E
	for <lists+linux-clk@lfdr.de>; Fri, 28 May 2021 06:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234306AbhE1E7b (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 28 May 2021 00:59:31 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:51828 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbhE1E7a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 May 2021 00:59:30 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14S4vmdk124441;
        Thu, 27 May 2021 23:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622177868;
        bh=n0EOad/BgEub5TYrK75niMn95jbCbHIn8nikZ/xeoSA=;
        h=From:To:CC:Subject:Date;
        b=ihnHS9jPEOLZxkNrfjo/6Ou2/Eg4Zv6ssfB2NhF1XIdWNKDFWt+3VtBgc0C6PfzBA
         YpPYwGqElCKmoawQmFOVyVVyFNmGEyNmNXEgaD5RZwcf0eRVqKkL9o0Y8wNFINzlqS
         u4AZxB1dxOjG9Unr30+tzCNOnfqve9CKt+tNSNfQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14S4vml3061307
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 May 2021 23:57:48 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 27
 May 2021 23:57:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 27 May 2021 23:57:48 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14S4viJ2087638;
        Thu, 27 May 2021 23:57:44 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Device Tree Mailing List <devicetree@vger.kernel.org>,
        <ssantosh@kernel.org>, Vignesh R <vigneshr@ti.com>,
        <linux-clk@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <kristo@kernel.org>, Nishanth Menon <nm@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v2 0/2] clk: keystone: Add support for AM64 specific ehrpwm-tbclk
Date:   Fri, 28 May 2021 10:27:41 +0530
Message-ID: <20210528045743.16537-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series adds support for AM64 specific ehrpwm Time-base submodule
clock.

Changes since v1:
- Fixed register offsets and bits for clocks.
- Update the compatible to ti,am64-epwm-tbclk, as high resolution is not
  supported in AM64.

Lokesh Vutla (2):
  dt-bindings: clock: ehrpwm: Add support for AM64 specific compatible
  clk: keystone: syscon-clk: Add support for AM64 specific ehrpwm-tbclk

 .../bindings/clock/ti,am654-ehrpwm-tbclk.yaml   |  4 +++-
 drivers/clk/keystone/syscon-clk.c               | 17 +++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

-- 
2.31.1

