Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B23F25BE673
	for <lists+linux-clk@lfdr.de>; Tue, 20 Sep 2022 14:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbiITMy2 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 20 Sep 2022 08:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbiITMxy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Sep 2022 08:53:54 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D6EB76465;
        Tue, 20 Sep 2022 05:53:31 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 42659320096D;
        Tue, 20 Sep 2022 08:53:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 20 Sep 2022 08:53:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1663678407; x=
        1663764807; bh=bznVlAm7CcwW9vUQI8XUe6+ILjJSwqZMClSNEtYWnA0=; b=A
        sKMnczh+2BDL5xM7Pns5gd6SDZYEktsEDc/vVkS4rEjfxNoDnlh54KLAqZoj+RUC
        5e0LP628Bcs6VyT54Kry52Ve8eIA3Bf4KE4PrsrnDHBzWm3cnORgNIVHr2bT2PO6
        4EmG4R3iqwawCgeyJOyYhJuz1B3r0Y3eOfwJHBkuO73t+Ja7KYJD7TNJzwOYpLVS
        xpmIGyixS3vjMzevFdRQWST1uci5Ct/exPmw6MgHQK/qLXa/YYqdCYK3Q7iiAN3a
        fqgfB8YqkFh4yJmzHL6SFjPnvwIUgpiOsU4owhRrqbjsYrU9xs28w6D6KWBGyodd
        po53ovDXB6sJmwrMg0qqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663678407; x=
        1663764807; bh=bznVlAm7CcwW9vUQI8XUe6+ILjJSwqZMClSNEtYWnA0=; b=X
        sOjUiFRSJbBFqt7qfe9eyPPr/XCQIHIOAKYEMuQi2fdOPzzz8aafL6iJ0csi85EU
        NeLlCVajKAFgCsKioZt19cgvn+0i3SmuUkPYJUaUxYhFJ4oXUFshnUO4he09djAJ
        85q8mM3oEjJo/hbTlsMNmRELyVHCtzPpKT56yahoJ+h3w63DyldkbVTaRSX1RMhE
        T+sTCJ56+uJAMhlC0+5s5/6qLDEzXdiJDCYqblMhK9wFIQqaOv1t4XpVWt9odgOS
        ZZi1IGFxKvk6loq0bXG1CUb21QyPxgW2BwWrNG1GNQpUYMLtntgD6ptlBnI1rO1e
        /ZqoJIR+oVd1B3RSRmXuA==
X-ME-Sender: <xms:x7cpYw1zvq7HoFqX6KleUDWqkxUedlt6ycTABqWgyRA3E5kL1X8a_w>
    <xme:x7cpY7HGZiCCgk4MEhTh3LfsnkPFOJC2Ft6UF0Ly0gAdKV73t0MccRyhLbqWH0w_K
    _MH6y5Le2D68iuDptU>
X-ME-Received: <xmr:x7cpY4730cJZ7jElNSEVuc_PtfOfugaVaA1of_nRMrEh727PdvsQWOJpc_xr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvledgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
    jeeltdevnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:x7cpY51nmzdsj5QbGRT8xUC5jW3gyIOpZfJj_gr3LBWuy3fJ_WfDMA>
    <xmx:x7cpYzHwQTP1RyydUlFbYPn3V4IXD6-An9QTYoanL053LvCeF6v9JA>
    <xmx:x7cpYy_n8Xze-9LjO2BPP0ms3PXjnv4G3Rz58Z_602f1MTVD20ZnXw>
    <xmx:x7cpY9FDKz-3kHbfhiScGdgD9ntDhBL96C9m0UUbvRl-omB3uFmQDw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Sep 2022 08:53:27 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Tue, 20 Sep 2022 14:50:20 +0200
Subject: [PATCH v2 1/7] firmware: raspberrypi: Introduce rpi_firmware_find_node()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v2-1-983276b83f62@cerno.tech>
References: <20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v2-0-983276b83f62@cerno.tech>
To:     Daniel Vetter <daniel@ffwll.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Scott Branden <sbranden@broadcom.com>,
        Stephen Boyd <sboyd@kernel.org>, Emma Anholt <emma@anholt.net>,
        Ray Jui <rjui@broadcom.com>, Maxime Ripard <mripard@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>,
        dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=sPYmav9OfSnKW2AKxDc1YspDgs/8ZuYriYV4H73zKeE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMma2/nUStbW2dvqKh7+InZYRUJb3HGb4tu1zj1sN6e/jttj
 aZreUcrCIMbFICumyBIjbL4k7tSs151sfPNg5rAygQxh4OIUgIlk3mBkmFAcxfuX74pIYrZNyaWkn4
 VhvfInT0/x0D20Zu6Zm/MFBBj+B+7pM/pjtPlmbfz90J/bzUrmn15gNf+5XLnHlzutVVuYWAE=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

A significant number of RaspberryPi drivers using the firmware don't
have a phandle to it, so end up scanning the device tree to find a node
with the firmware compatible.

That code is duplicated everywhere, so let's introduce a helper instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 4b8978b254f9..b916e1e171f8 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -311,6 +311,13 @@ static int rpi_firmware_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id rpi_firmware_of_match[];
+struct device_node *rpi_firmware_find_node(void)
+{
+	return of_find_matching_node(NULL, rpi_firmware_of_match);
+}
+EXPORT_SYMBOL_GPL(rpi_firmware_find_node);
+
 /**
  * rpi_firmware_get - Get pointer to rpi_firmware structure.
  * @firmware_node:    Pointer to the firmware Device Tree node.
diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 811ea668c4a1..63426082bcb9 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -142,6 +142,7 @@ int rpi_firmware_property(struct rpi_firmware *fw,
 int rpi_firmware_property_list(struct rpi_firmware *fw,
 			       void *data, size_t tag_size);
 void rpi_firmware_put(struct rpi_firmware *fw);
+struct device_node *rpi_firmware_find_node(void);
 struct rpi_firmware *rpi_firmware_get(struct device_node *firmware_node);
 struct rpi_firmware *devm_rpi_firmware_get(struct device *dev,
 					   struct device_node *firmware_node);
@@ -159,6 +160,12 @@ static inline int rpi_firmware_property_list(struct rpi_firmware *fw,
 }
 
 static inline void rpi_firmware_put(struct rpi_firmware *fw) { }
+
+static inline struct device_node *rpi_firmware_find_node(void)
+{
+	return NULL;
+}
+
 static inline struct rpi_firmware *rpi_firmware_get(struct device_node *firmware_node)
 {
 	return NULL;

-- 
b4 0.10.0
