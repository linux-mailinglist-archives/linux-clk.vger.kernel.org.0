Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66C6A4E3134
	for <lists+linux-clk@lfdr.de>; Mon, 21 Mar 2022 21:08:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352958AbiCUUJr (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 21 Mar 2022 16:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352946AbiCUUJi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Mar 2022 16:09:38 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 307DEEA9
        for <linux-clk@vger.kernel.org>; Mon, 21 Mar 2022 13:07:56 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id r10so22252981wrp.3
        for <linux-clk@vger.kernel.org>; Mon, 21 Mar 2022 13:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UQNU+zESf8LDh+yao8Oc3gO6dXSE2ne6kHnyQ9VdhdQ=;
        b=bCWuedgEdxQ7ZPcn7Zt8Lml8+iEWLNQVUY0rUru/QtoYn0MOrpEUsyLpekVCNDYCJ+
         YeEdphO1oqFtPGEyEIBfxShBostEBw7ElvU8b5Hb6BRr+ZDTU7P2/s8WLpAcW4WNNjqL
         dy0io7iO7xqlE/pYqgFzVtYTt+zUOE5WjMEhFrPmLiCXtOIe/fMI6Hi/PRu9fzg36a70
         YUfaeSodXPYFR5VsIiKvhxSORikLu9Gh6Ou8lcaBABQ6O6Z3AUI4FWn3jC+iEUihnC+y
         Jc4yvH4jmgX/8RFmeqAyG1h4DG/9+QCquKHhPAqEq2RVYHhlSVURqhgGR141duC/bvV1
         B89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UQNU+zESf8LDh+yao8Oc3gO6dXSE2ne6kHnyQ9VdhdQ=;
        b=YU2zFZJBBEQ1XhkxG40ZyKmzmnMNTl2Pq2C2WIxxx07LpJwu+tLf4Werd+hes0N3Fo
         tGfZsOMn5bHwJWS4wp9NQbIGIKFYPr/vlYY1m65TmNxi1pAInEDmRibuw/Tdnrg2FlVc
         55CsUlPdneS1OFzGVkgaS9vK6Mus/2XM8UPjkZrcS4ShfvWCr06Fkqc3JU8J/Y7efOyW
         NPqWHASS5UX9vxboSe0fr5TsqmJdiNvhOLelXVzQe7AOBSdv2y/13Xt12RwsqzpUF+pF
         fQUhfODLquiWqrmiGtb33X9Oo08GNEQMqqDr4Dx7xgawBxWSgpG0rtWsS+FSxXypnfqh
         F20w==
X-Gm-Message-State: AOAM532poDEFQGU12N3K4m7pSKDR+04kFgk1rA32p5Nlic81djZ6nC0P
        5I5kdwuZetaKKIM90lLWRVeROQ==
X-Google-Smtp-Source: ABdhPJw+YjFMcmO2mxPCtPyEBZnTzJXXr/ng5v/aNNYmHjLenv/wVVgoiGG3XNBwDlHVKQmZZJYNJw==
X-Received: by 2002:a5d:6442:0:b0:203:dff2:866c with SMTP id d2-20020a5d6442000000b00203dff2866cmr19241487wrw.465.1647893274691;
        Mon, 21 Mar 2022 13:07:54 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id i14-20020a0560001ace00b00203da1fa749sm24426988wry.72.2022.03.21.13.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 13:07:54 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au, krzk+dt@kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 07/26] crypto: rockchip: add fallback for ahash
Date:   Mon, 21 Mar 2022 20:07:20 +0000
Message-Id: <20220321200739.3572792-8-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321200739.3572792-1-clabbe@baylibre.com>
References: <20220321200739.3572792-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Adds a fallback for all case hardware cannot handle.

Fixes: ce0183cb6464b ("crypto: rockchip - switch to skcipher API")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/rockchip/rk3288_crypto_ahash.c | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/crypto/rockchip/rk3288_crypto_ahash.c b/drivers/crypto/rockchip/rk3288_crypto_ahash.c
index 49017d1fb510..16009bb0bf16 100644
--- a/drivers/crypto/rockchip/rk3288_crypto_ahash.c
+++ b/drivers/crypto/rockchip/rk3288_crypto_ahash.c
@@ -16,6 +16,40 @@
  * so we put the fixed hash out when met zero message.
  */
 
+static bool rk_ahash_need_fallback(struct ahash_request *req)
+{
+	struct scatterlist *sg;
+
+	sg = req->src;
+	while (sg) {
+		if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
+			return true;
+		}
+		if (sg->length % 4) {
+			return true;
+		}
+		sg = sg_next(sg);
+	}
+	return false;
+}
+
+static int rk_ahash_digest_fb(struct ahash_request *areq)
+{
+	struct rk_ahash_rctx *rctx = ahash_request_ctx(areq);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
+	struct rk_ahash_ctx *tfmctx = crypto_ahash_ctx(tfm);
+
+	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
+	rctx->fallback_req.base.flags = areq->base.flags &
+					CRYPTO_TFM_REQ_MAY_SLEEP;
+
+	rctx->fallback_req.nbytes = areq->nbytes;
+	rctx->fallback_req.src = areq->src;
+	rctx->fallback_req.result = areq->result;
+
+	return crypto_ahash_digest(&rctx->fallback_req);
+}
+
 static int zero_message_process(struct ahash_request *req)
 {
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
@@ -167,6 +201,9 @@ static int rk_ahash_digest(struct ahash_request *req)
 	struct rk_ahash_ctx *tctx = crypto_tfm_ctx(req->base.tfm);
 	struct rk_crypto_info *dev = tctx->dev;
 
+	if (rk_ahash_need_fallback(req))
+		return rk_ahash_digest_fb(req);
+
 	if (!req->nbytes)
 		return zero_message_process(req);
 	else
@@ -309,6 +346,7 @@ static void rk_cra_hash_exit(struct crypto_tfm *tfm)
 	struct rk_ahash_ctx *tctx = crypto_tfm_ctx(tfm);
 
 	free_page((unsigned long)tctx->dev->addr_vir);
+	crypto_free_ahash(tctx->fallback_tfm);
 }
 
 struct rk_crypto_tmp rk_ahash_sha1 = {
-- 
2.34.1

