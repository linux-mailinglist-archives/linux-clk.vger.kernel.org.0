Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8604A5682EB
	for <lists+linux-clk@lfdr.de>; Wed,  6 Jul 2022 11:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232821AbiGFJFk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 6 Jul 2022 05:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232726AbiGFJE7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 05:04:59 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2AA82315A
        for <linux-clk@vger.kernel.org>; Wed,  6 Jul 2022 02:04:43 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id o19-20020a05600c4fd300b003a0489f414cso8585609wmq.4
        for <linux-clk@vger.kernel.org>; Wed, 06 Jul 2022 02:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vvLoc7JgLxlDmegtH87NunTN8x9IQJmltG64X4dvE5o=;
        b=Q+lAd6oUdrfJwaNMmsiICDGS0PGNoBKd4H0e8lxYF2NS6o9KUpfChmyNK1iaGbNP3+
         6Jg13BCIfgfCPTEPhvmom60lYZW6IS0ozJN6K3tWAk5xwALZLWcMAi99ta/0bi0YvAuU
         7WG2Qu+pwzSU9+Ja0+NoQ7YQyHJxZE7NFAwDdyO2K31ZzodlJCNMdXYRjKrzRQiS6dD5
         z3s/m2Z7nfyxHlfVOUguk6qtJJteT80b60uNgOzk3MfiTnelhGLaS8foILxa83TGddOM
         yv8Nws+wlKnD26efG/aAZKctPItmti94i5dksG7/8MN/EhWPeA00bstbONA6pxOaTs6T
         3Exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vvLoc7JgLxlDmegtH87NunTN8x9IQJmltG64X4dvE5o=;
        b=LVKOFsOrKOiVenvZc/804CMiJhxEWVuNeNBT5HCajExVf0B+w1diO96KsrNDwS5cQj
         aR8S0+lhkE0BIW1DGGowSPz6li1opDgL9FRCiEkpI7/hvWE8sNOe22WBYfYRQBtOjPu+
         HkZy2bGXMNEA76ebBGTO0PLKJHwnZ13jFtN7W8Wkz/V1TV33CB+Q3NPU6Oz9ThrLBMGA
         AN/eiS0yqErI2PKSa24+c0SZZ6IClp9UnIxRejp1aK7/EVkvk9qdkRu+yxYbCtz49or+
         I+TpJZuy+QovHOa21RW+f2pZiXiAi2bQKofwniCKR4jUME3vR+ezcqHMTTl2l6PC9yeW
         iqyw==
X-Gm-Message-State: AJIora/5vRg4EUScxMGjNWNPwLdOk920jOrPVTVygV0/1/TNZMO2jZEH
        PdHmdA3V1Ha36klCrKveXWHr4g==
X-Google-Smtp-Source: AGRyM1t1epReE0Yy1wIuj/nlbSeyDzx7u/cCWGEgvBpAN3S8CThksCp8SvCPMWoRQmMrvipqry4zuQ==
X-Received: by 2002:a05:600c:3d8f:b0:3a1:8c7f:1908 with SMTP id bi15-20020a05600c3d8f00b003a18c7f1908mr29307442wmb.201.1657098283444;
        Wed, 06 Jul 2022 02:04:43 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id v11-20020adfe28b000000b0021d6ef34b2asm5230223wri.51.2022.07.06.02.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 02:04:42 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        p.zabel@pengutronix.de, robh+dt@kernel.org, sboyd@kernel.org
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        john@metanate.com, didi.debian@cknow.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v8 10/33] crypto: rockchip: rework by using crypto_engine
Date:   Wed,  6 Jul 2022 09:03:49 +0000
Message-Id: <20220706090412.806101-11-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706090412.806101-1-clabbe@baylibre.com>
References: <20220706090412.806101-1-clabbe@baylibre.com>
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

Instead of doing manual queue management, let's use the crypto/engine
for that.
In the same time, rework the requests handling to be easier to
understand (and fix all bugs related to them).

Fixes: ce0183cb6464b ("crypto: rockchip - switch to skcipher API")
Reviewed-by: John Keeping <john@metanate.com>
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/Kconfig                        |   1 +
 drivers/crypto/rockchip/rk3288_crypto.c       | 152 +----------
 drivers/crypto/rockchip/rk3288_crypto.h       |  39 +--
 drivers/crypto/rockchip/rk3288_crypto_ahash.c | 144 +++++-----
 .../crypto/rockchip/rk3288_crypto_skcipher.c  | 250 +++++++++---------
 5 files changed, 221 insertions(+), 365 deletions(-)

diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
index c293f801806c..df4f0a2de098 100644
--- a/drivers/crypto/Kconfig
+++ b/drivers/crypto/Kconfig
@@ -789,6 +789,7 @@ config CRYPTO_DEV_ROCKCHIP
 	select CRYPTO_CBC
 	select CRYPTO_DES
 	select CRYPTO_AES
+	select CRYPTO_ENGINE
 	select CRYPTO_LIB_DES
 	select CRYPTO_MD5
 	select CRYPTO_SHA1
diff --git a/drivers/crypto/rockchip/rk3288_crypto.c b/drivers/crypto/rockchip/rk3288_crypto.c
index b3db096e2ec2..1afb65eee6c9 100644
--- a/drivers/crypto/rockchip/rk3288_crypto.c
+++ b/drivers/crypto/rockchip/rk3288_crypto.c
@@ -65,149 +65,24 @@ static void rk_crypto_disable_clk(struct rk_crypto_info *dev)
 	clk_disable_unprepare(dev->sclk);
 }
 
-static int check_alignment(struct scatterlist *sg_src,
-			   struct scatterlist *sg_dst,
-			   int align_mask)
-{
-	int in, out, align;
-
-	in = IS_ALIGNED((uint32_t)sg_src->offset, 4) &&
-	     IS_ALIGNED((uint32_t)sg_src->length, align_mask);
-	if (!sg_dst)
-		return in;
-	out = IS_ALIGNED((uint32_t)sg_dst->offset, 4) &&
-	      IS_ALIGNED((uint32_t)sg_dst->length, align_mask);
-	align = in && out;
-
-	return (align && (sg_src->length == sg_dst->length));
-}
-
-static int rk_load_data(struct rk_crypto_info *dev,
-			struct scatterlist *sg_src,
-			struct scatterlist *sg_dst)
-{
-	unsigned int count;
-
-	count = min(dev->left_bytes, sg_src->length);
-	dev->left_bytes -= count;
-
-	if (!dma_map_sg(dev->dev, sg_src, 1, DMA_TO_DEVICE)) {
-		dev_err(dev->dev, "[%s:%d] dma_map_sg(src)  error\n",
-				__func__, __LINE__);
-		return -EINVAL;
-	}
-	dev->addr_in = sg_dma_address(sg_src);
-
-	if (sg_dst) {
-		if (!dma_map_sg(dev->dev, sg_dst, 1, DMA_FROM_DEVICE)) {
-			dev_err(dev->dev,
-					"[%s:%d] dma_map_sg(dst)  error\n",
-					__func__, __LINE__);
-			dma_unmap_sg(dev->dev, sg_src, 1,
-					DMA_TO_DEVICE);
-			return -EINVAL;
-		}
-		dev->addr_out = sg_dma_address(sg_dst);
-	}
-	dev->count = count;
-	return 0;
-}
-
-static void rk_unload_data(struct rk_crypto_info *dev)
-{
-	struct scatterlist *sg_in, *sg_out;
-
-	sg_in = dev->sg_src;
-	dma_unmap_sg(dev->dev, sg_in, 1, DMA_TO_DEVICE);
-
-	if (dev->sg_dst) {
-		sg_out = dev->sg_dst;
-		dma_unmap_sg(dev->dev, sg_out, 1, DMA_FROM_DEVICE);
-	}
-}
-
 static irqreturn_t rk_crypto_irq_handle(int irq, void *dev_id)
 {
 	struct rk_crypto_info *dev  = platform_get_drvdata(dev_id);
 	u32 interrupt_status;
 
-	spin_lock(&dev->lock);
 	interrupt_status = CRYPTO_READ(dev, RK_CRYPTO_INTSTS);
 	CRYPTO_WRITE(dev, RK_CRYPTO_INTSTS, interrupt_status);
 
+	dev->status = 1;
 	if (interrupt_status & 0x0a) {
 		dev_warn(dev->dev, "DMA Error\n");
-		dev->err = -EFAULT;
+		dev->status = 0;
 	}
-	tasklet_schedule(&dev->done_task);
+	complete(&dev->complete);
 
-	spin_unlock(&dev->lock);
 	return IRQ_HANDLED;
 }
 
-static int rk_crypto_enqueue(struct rk_crypto_info *dev,
-			      struct crypto_async_request *async_req)
-{
-	unsigned long flags;
-	int ret;
-
-	spin_lock_irqsave(&dev->lock, flags);
-	ret = crypto_enqueue_request(&dev->queue, async_req);
-	if (dev->busy) {
-		spin_unlock_irqrestore(&dev->lock, flags);
-		return ret;
-	}
-	dev->busy = true;
-	spin_unlock_irqrestore(&dev->lock, flags);
-	tasklet_schedule(&dev->queue_task);
-
-	return ret;
-}
-
-static void rk_crypto_queue_task_cb(unsigned long data)
-{
-	struct rk_crypto_info *dev = (struct rk_crypto_info *)data;
-	struct crypto_async_request *async_req, *backlog;
-	unsigned long flags;
-	int err = 0;
-
-	dev->err = 0;
-	spin_lock_irqsave(&dev->lock, flags);
-	backlog   = crypto_get_backlog(&dev->queue);
-	async_req = crypto_dequeue_request(&dev->queue);
-
-	if (!async_req) {
-		dev->busy = false;
-		spin_unlock_irqrestore(&dev->lock, flags);
-		return;
-	}
-	spin_unlock_irqrestore(&dev->lock, flags);
-
-	if (backlog) {
-		backlog->complete(backlog, -EINPROGRESS);
-		backlog = NULL;
-	}
-
-	dev->async_req = async_req;
-	err = dev->start(dev);
-	if (err)
-		dev->complete(dev->async_req, err);
-}
-
-static void rk_crypto_done_task_cb(unsigned long data)
-{
-	struct rk_crypto_info *dev = (struct rk_crypto_info *)data;
-
-	if (dev->err) {
-		dev->complete(dev->async_req, dev->err);
-		return;
-	}
-
-	dev->err = dev->update(dev);
-	if (dev->err)
-		dev->complete(dev->async_req, dev->err);
-}
-
 static struct rk_crypto_tmp *rk_cipher_algs[] = {
 	&rk_ecb_aes_alg,
 	&rk_cbc_aes_alg,
@@ -300,8 +175,6 @@ static int rk_crypto_probe(struct platform_device *pdev)
 	if (err)
 		goto err_crypto;
 
-	spin_lock_init(&crypto_info->lock);
-
 	crypto_info->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(crypto_info->reg)) {
 		err = PTR_ERR(crypto_info->reg);
@@ -351,17 +224,11 @@ static int rk_crypto_probe(struct platform_device *pdev)
 	crypto_info->dev = &pdev->dev;
 	platform_set_drvdata(pdev, crypto_info);
 
-	tasklet_init(&crypto_info->queue_task,
-		     rk_crypto_queue_task_cb, (unsigned long)crypto_info);
-	tasklet_init(&crypto_info->done_task,
-		     rk_crypto_done_task_cb, (unsigned long)crypto_info);
-	crypto_init_queue(&crypto_info->queue, 50);
+	crypto_info->engine = crypto_engine_alloc_init(&pdev->dev, true);
+	crypto_engine_start(crypto_info->engine);
+	init_completion(&crypto_info->complete);
 
 	rk_crypto_enable_clk(crypto_info);
-	crypto_info->load_data = rk_load_data;
-	crypto_info->unload_data = rk_unload_data;
-	crypto_info->enqueue = rk_crypto_enqueue;
-	crypto_info->busy = false;
 
 	err = rk_crypto_register(crypto_info);
 	if (err) {
@@ -373,9 +240,9 @@ static int rk_crypto_probe(struct platform_device *pdev)
 	return 0;
 
 err_register_alg:
-	tasklet_kill(&crypto_info->queue_task);
-	tasklet_kill(&crypto_info->done_task);
+	crypto_engine_exit(crypto_info->engine);
 err_crypto:
+	dev_err(dev, "Crypto Accelerator not successfully registered\n");
 	return err;
 }
 
@@ -385,8 +252,7 @@ static int rk_crypto_remove(struct platform_device *pdev)
 
 	rk_crypto_unregister();
 	rk_crypto_disable_clk(crypto_tmp);
-	tasklet_kill(&crypto_tmp->done_task);
-	tasklet_kill(&crypto_tmp->queue_task);
+	crypto_engine_exit(crypto_tmp->engine);
 	return 0;
 }
 
diff --git a/drivers/crypto/rockchip/rk3288_crypto.h b/drivers/crypto/rockchip/rk3288_crypto.h
index a7de5738f6dc..65ed645e0168 100644
--- a/drivers/crypto/rockchip/rk3288_crypto.h
+++ b/drivers/crypto/rockchip/rk3288_crypto.h
@@ -5,9 +5,11 @@
 #include <crypto/aes.h>
 #include <crypto/internal/des.h>
 #include <crypto/algapi.h>
+#include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
 #include <linux/scatterlist.h>
+#include <crypto/engine.h>
 #include <crypto/internal/hash.h>
 #include <crypto/internal/skcipher.h>
 
@@ -193,39 +195,15 @@ struct rk_crypto_info {
 	struct reset_control		*rst;
 	void __iomem			*reg;
 	int				irq;
-	struct crypto_queue		queue;
-	struct tasklet_struct		queue_task;
-	struct tasklet_struct		done_task;
-	struct crypto_async_request	*async_req;
-	int 				err;
-	/* device lock */
-	spinlock_t			lock;
-
-	/* the public variable */
-	struct scatterlist		*sg_src;
-	struct scatterlist		*sg_dst;
-	struct scatterlist		*first;
-	unsigned int			left_bytes;
-	size_t				src_nents;
-	size_t				dst_nents;
-	unsigned int			total;
-	unsigned int			count;
-	dma_addr_t			addr_in;
-	dma_addr_t			addr_out;
-	bool				busy;
-	int (*start)(struct rk_crypto_info *dev);
-	int (*update)(struct rk_crypto_info *dev);
-	void (*complete)(struct crypto_async_request *base, int err);
-	int (*load_data)(struct rk_crypto_info *dev,
-			 struct scatterlist *sg_src,
-			 struct scatterlist *sg_dst);
-	void (*unload_data)(struct rk_crypto_info *dev);
-	int (*enqueue)(struct rk_crypto_info *dev,
-		       struct crypto_async_request *async_req);
+
+	struct crypto_engine *engine;
+	struct completion complete;
+	int status;
 };
 
 /* the private variable of hash */
 struct rk_ahash_ctx {
+	struct crypto_engine_ctx enginectx;
 	struct rk_crypto_info		*dev;
 	/* for fallback */
 	struct crypto_ahash		*fallback_tfm;
@@ -235,10 +213,12 @@ struct rk_ahash_ctx {
 struct rk_ahash_rctx {
 	struct ahash_request		fallback_req;
 	u32				mode;
+	int nrsg;
 };
 
 /* the private variable of cipher */
 struct rk_cipher_ctx {
+	struct crypto_engine_ctx enginectx;
 	struct rk_crypto_info		*dev;
 	unsigned int			keylen;
 	u8				key[AES_MAX_KEY_SIZE];
@@ -247,6 +227,7 @@ struct rk_cipher_ctx {
 };
 
 struct rk_cipher_rctx {
+	u8 backup_iv[AES_BLOCK_SIZE];
 	u32				mode;
 	struct skcipher_request fallback_req;   // keep at the end
 };
diff --git a/drivers/crypto/rockchip/rk3288_crypto_ahash.c b/drivers/crypto/rockchip/rk3288_crypto_ahash.c
index c762e462eb57..edd40e16a3f0 100644
--- a/drivers/crypto/rockchip/rk3288_crypto_ahash.c
+++ b/drivers/crypto/rockchip/rk3288_crypto_ahash.c
@@ -9,6 +9,7 @@
  * Some ideas are from marvell/cesa.c and s5p-sss.c driver.
  */
 #include <linux/device.h>
+#include <asm/unaligned.h>
 #include "rk3288_crypto.h"
 
 /*
@@ -72,16 +73,12 @@ static int zero_message_process(struct ahash_request *req)
 	return 0;
 }
 
-static void rk_ahash_crypto_complete(struct crypto_async_request *base, int err)
+static void rk_ahash_reg_init(struct ahash_request *req)
 {
-	if (base->complete)
-		base->complete(base, err);
-}
-
-static void rk_ahash_reg_init(struct rk_crypto_info *dev)
-{
-	struct ahash_request *req = ahash_request_cast(dev->async_req);
 	struct rk_ahash_rctx *rctx = ahash_request_ctx(req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct rk_ahash_ctx *tctx = crypto_ahash_ctx(tfm);
+	struct rk_crypto_info *dev = tctx->dev;
 	int reg_status;
 
 	reg_status = CRYPTO_READ(dev, RK_CRYPTO_CTRL) |
@@ -108,7 +105,7 @@ static void rk_ahash_reg_init(struct rk_crypto_info *dev)
 					  RK_CRYPTO_BYTESWAP_BRFIFO |
 					  RK_CRYPTO_BYTESWAP_BTFIFO);
 
-	CRYPTO_WRITE(dev, RK_CRYPTO_HASH_MSG_LEN, dev->total);
+	CRYPTO_WRITE(dev, RK_CRYPTO_HASH_MSG_LEN, req->nbytes);
 }
 
 static int rk_ahash_init(struct ahash_request *req)
@@ -206,44 +203,59 @@ static int rk_ahash_digest(struct ahash_request *req)
 
 	if (!req->nbytes)
 		return zero_message_process(req);
-	else
-		return dev->enqueue(dev, &req->base);
+
+	return crypto_transfer_hash_request_to_engine(dev->engine, req);
 }
 
-static void crypto_ahash_dma_start(struct rk_crypto_info *dev)
+static void crypto_ahash_dma_start(struct rk_crypto_info *dev, struct scatterlist *sg)
 {
-	CRYPTO_WRITE(dev, RK_CRYPTO_HRDMAS, dev->addr_in);
-	CRYPTO_WRITE(dev, RK_CRYPTO_HRDMAL, (dev->count + 3) / 4);
+	CRYPTO_WRITE(dev, RK_CRYPTO_HRDMAS, sg_dma_address(sg));
+	CRYPTO_WRITE(dev, RK_CRYPTO_HRDMAL, sg_dma_len(sg) / 4);
 	CRYPTO_WRITE(dev, RK_CRYPTO_CTRL, RK_CRYPTO_HASH_START |
 					  (RK_CRYPTO_HASH_START << 16));
 }
 
-static int rk_ahash_set_data_start(struct rk_crypto_info *dev)
+static int rk_hash_prepare(struct crypto_engine *engine, void *breq)
+{
+	struct ahash_request *areq = container_of(breq, struct ahash_request, base);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
+	struct rk_ahash_rctx *rctx = ahash_request_ctx(areq);
+	struct rk_ahash_ctx *tctx = crypto_ahash_ctx(tfm);
+	int ret;
+
+	ret = dma_map_sg(tctx->dev->dev, areq->src, sg_nents(areq->src), DMA_TO_DEVICE);
+	if (ret <= 0)
+		return -EINVAL;
+
+	rctx->nrsg = ret;
+
+	return 0;
+}
+
+static int rk_hash_unprepare(struct crypto_engine *engine, void *breq)
 {
-	int err;
+	struct ahash_request *areq = container_of(breq, struct ahash_request, base);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
+	struct rk_ahash_rctx *rctx = ahash_request_ctx(areq);
+	struct rk_ahash_ctx *tctx = crypto_ahash_ctx(tfm);
 
-	err = dev->load_data(dev, dev->sg_src, NULL);
-	if (!err)
-		crypto_ahash_dma_start(dev);
-	return err;
+	dma_unmap_sg(tctx->dev->dev, areq->src, rctx->nrsg, DMA_TO_DEVICE);
+	return 0;
 }
 
-static int rk_ahash_start(struct rk_crypto_info *dev)
+static int rk_hash_run(struct crypto_engine *engine, void *breq)
 {
-	struct ahash_request *req = ahash_request_cast(dev->async_req);
-	struct crypto_ahash *tfm;
-	struct rk_ahash_rctx *rctx;
-
-	dev->total = req->nbytes;
-	dev->left_bytes = req->nbytes;
-	dev->sg_dst = NULL;
-	dev->sg_src = req->src;
-	dev->first = req->src;
-	dev->src_nents = sg_nents(req->src);
-	rctx = ahash_request_ctx(req);
+	struct ahash_request *areq = container_of(breq, struct ahash_request, base);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
+	struct rk_ahash_rctx *rctx = ahash_request_ctx(areq);
+	struct rk_ahash_ctx *tctx = crypto_ahash_ctx(tfm);
+	struct scatterlist *sg = areq->src;
+	int err = 0;
+	int i;
+	u32 v;
+
 	rctx->mode = 0;
 
-	tfm = crypto_ahash_reqtfm(req);
 	switch (crypto_ahash_digestsize(tfm)) {
 	case SHA1_DIGEST_SIZE:
 		rctx->mode = RK_CRYPTO_HASH_SHA1;
@@ -255,30 +267,26 @@ static int rk_ahash_start(struct rk_crypto_info *dev)
 		rctx->mode = RK_CRYPTO_HASH_MD5;
 		break;
 	default:
-		return -EINVAL;
+		err =  -EINVAL;
+		goto theend;
 	}
 
-	rk_ahash_reg_init(dev);
-	return rk_ahash_set_data_start(dev);
-}
+	rk_ahash_reg_init(areq);
 
-static int rk_ahash_crypto_rx(struct rk_crypto_info *dev)
-{
-	int err = 0;
-	struct ahash_request *req = ahash_request_cast(dev->async_req);
-	struct crypto_ahash *tfm;
-
-	dev->unload_data(dev);
-	if (dev->left_bytes) {
-		if (sg_is_last(dev->sg_src)) {
-			dev_warn(dev->dev, "[%s:%d], Lack of data\n",
-					__func__, __LINE__);
-			err = -ENOMEM;
-			goto out_rx;
+	while (sg) {
+		reinit_completion(&tctx->dev->complete);
+		tctx->dev->status = 0;
+		crypto_ahash_dma_start(tctx->dev, sg);
+		wait_for_completion_interruptible_timeout(&tctx->dev->complete,
+							  msecs_to_jiffies(2000));
+		if (!tctx->dev->status) {
+			dev_err(tctx->dev->dev, "DMA timeout\n");
+			err = -EFAULT;
+			goto theend;
 		}
-		dev->sg_src = sg_next(dev->sg_src);
-		err = rk_ahash_set_data_start(dev);
-	} else {
+		sg = sg_next(sg);
+	}
+
 		/*
 		 * it will take some time to process date after last dma
 		 * transmission.
@@ -289,18 +297,20 @@ static int rk_ahash_crypto_rx(struct rk_crypto_info *dev)
 		 * efficiency, and make it response quickly when dma
 		 * complete.
 		 */
-		while (!CRYPTO_READ(dev, RK_CRYPTO_HASH_STS))
-			udelay(10);
-
-		tfm = crypto_ahash_reqtfm(req);
-		memcpy_fromio(req->result, dev->reg + RK_CRYPTO_HASH_DOUT_0,
-			      crypto_ahash_digestsize(tfm));
-		dev->complete(dev->async_req, 0);
-		tasklet_schedule(&dev->queue_task);
+	while (!CRYPTO_READ(tctx->dev, RK_CRYPTO_HASH_STS))
+		udelay(10);
+
+	for (i = 0; i < crypto_ahash_digestsize(tfm) / 4; i++) {
+		v = readl(tctx->dev->reg + RK_CRYPTO_HASH_DOUT_0 + i * 4);
+		put_unaligned_le32(v, areq->result + i * 4);
 	}
 
-out_rx:
-	return err;
+theend:
+	local_bh_disable();
+	crypto_finalize_hash_request(engine, breq, err);
+	local_bh_enable();
+
+	return 0;
 }
 
 static int rk_cra_hash_init(struct crypto_tfm *tfm)
@@ -314,9 +324,6 @@ static int rk_cra_hash_init(struct crypto_tfm *tfm)
 	algt = container_of(alg, struct rk_crypto_tmp, alg.hash);
 
 	tctx->dev = algt->dev;
-	tctx->dev->start = rk_ahash_start;
-	tctx->dev->update = rk_ahash_crypto_rx;
-	tctx->dev->complete = rk_ahash_crypto_complete;
 
 	/* for fallback */
 	tctx->fallback_tfm = crypto_alloc_ahash(alg_name, 0,
@@ -325,10 +332,15 @@ static int rk_cra_hash_init(struct crypto_tfm *tfm)
 		dev_err(tctx->dev->dev, "Could not load fallback driver.\n");
 		return PTR_ERR(tctx->fallback_tfm);
 	}
+
 	crypto_ahash_set_reqsize(__crypto_ahash_cast(tfm),
 				 sizeof(struct rk_ahash_rctx) +
 				 crypto_ahash_reqsize(tctx->fallback_tfm));
 
+	tctx->enginectx.op.do_one_request = rk_hash_run;
+	tctx->enginectx.op.prepare_request = rk_hash_prepare;
+	tctx->enginectx.op.unprepare_request = rk_hash_unprepare;
+
 	return 0;
 }
 
diff --git a/drivers/crypto/rockchip/rk3288_crypto_skcipher.c b/drivers/crypto/rockchip/rk3288_crypto_skcipher.c
index d067b7f09165..67a7e05d5ae3 100644
--- a/drivers/crypto/rockchip/rk3288_crypto_skcipher.c
+++ b/drivers/crypto/rockchip/rk3288_crypto_skcipher.c
@@ -9,6 +9,7 @@
  * Some ideas are from marvell-cesa.c and s5p-sss.c driver.
  */
 #include <linux/device.h>
+#include <crypto/scatterwalk.h>
 #include "rk3288_crypto.h"
 
 #define RK_CRYPTO_DEC			BIT(0)
@@ -70,19 +71,15 @@ static int rk_cipher_fallback(struct skcipher_request *areq)
 	return err;
 }
 
-static void rk_crypto_complete(struct crypto_async_request *base, int err)
-{
-	if (base->complete)
-		base->complete(base, err);
-}
-
 static int rk_handle_req(struct rk_crypto_info *dev,
 			 struct skcipher_request *req)
 {
+	struct crypto_engine *engine = dev->engine;
+
 	if (rk_cipher_need_fallback(req))
 		return rk_cipher_fallback(req);
 
-	return dev->enqueue(dev, &req->base);
+	return crypto_transfer_skcipher_request_to_engine(engine, req);
 }
 
 static int rk_aes_setkey(struct crypto_skcipher *cipher,
@@ -265,25 +262,21 @@ static int rk_des3_ede_cbc_decrypt(struct skcipher_request *req)
 	return rk_handle_req(dev, req);
 }
 
-static void rk_ablk_hw_init(struct rk_crypto_info *dev)
+static void rk_ablk_hw_init(struct rk_crypto_info *dev, struct skcipher_request *req)
 {
-	struct skcipher_request *req =
-		skcipher_request_cast(dev->async_req);
 	struct crypto_skcipher *cipher = crypto_skcipher_reqtfm(req);
 	struct crypto_tfm *tfm = crypto_skcipher_tfm(cipher);
 	struct rk_cipher_rctx *rctx = skcipher_request_ctx(req);
 	struct rk_cipher_ctx *ctx = crypto_skcipher_ctx(cipher);
-	u32 ivsize, block, conf_reg = 0;
+	u32 block, conf_reg = 0;
 
 	block = crypto_tfm_alg_blocksize(tfm);
-	ivsize = crypto_skcipher_ivsize(cipher);
 
 	if (block == DES_BLOCK_SIZE) {
 		rctx->mode |= RK_CRYPTO_TDES_FIFO_MODE |
 			     RK_CRYPTO_TDES_BYTESWAP_KEY |
 			     RK_CRYPTO_TDES_BYTESWAP_IV;
 		CRYPTO_WRITE(dev, RK_CRYPTO_TDES_CTRL, rctx->mode);
-		memcpy_toio(dev->reg + RK_CRYPTO_TDES_IV_0, req->iv, ivsize);
 		memcpy_toio(ctx->dev->reg + RK_CRYPTO_TDES_KEY1_0, ctx->key, ctx->keylen);
 		conf_reg = RK_CRYPTO_DESSEL;
 	} else {
@@ -296,7 +289,6 @@ static void rk_ablk_hw_init(struct rk_crypto_info *dev)
 		else if (ctx->keylen == AES_KEYSIZE_256)
 			rctx->mode |= RK_CRYPTO_AES_256BIT_key;
 		CRYPTO_WRITE(dev, RK_CRYPTO_AES_CTRL, rctx->mode);
-		memcpy_toio(dev->reg + RK_CRYPTO_AES_IV_0, req->iv, ivsize);
 		memcpy_toio(ctx->dev->reg + RK_CRYPTO_AES_KEY_0, ctx->key, ctx->keylen);
 	}
 	conf_reg |= RK_CRYPTO_BYTESWAP_BTFIFO |
@@ -306,133 +298,138 @@ static void rk_ablk_hw_init(struct rk_crypto_info *dev)
 		     RK_CRYPTO_BCDMA_ERR_ENA | RK_CRYPTO_BCDMA_DONE_ENA);
 }
 
-static void crypto_dma_start(struct rk_crypto_info *dev)
+static void crypto_dma_start(struct rk_crypto_info *dev,
+			     struct scatterlist *sgs,
+			     struct scatterlist *sgd, unsigned int todo)
 {
-	CRYPTO_WRITE(dev, RK_CRYPTO_BRDMAS, dev->addr_in);
-	CRYPTO_WRITE(dev, RK_CRYPTO_BRDMAL, dev->count / 4);
-	CRYPTO_WRITE(dev, RK_CRYPTO_BTDMAS, dev->addr_out);
+	CRYPTO_WRITE(dev, RK_CRYPTO_BRDMAS, sg_dma_address(sgs));
+	CRYPTO_WRITE(dev, RK_CRYPTO_BRDMAL, todo);
+	CRYPTO_WRITE(dev, RK_CRYPTO_BTDMAS, sg_dma_address(sgd));
 	CRYPTO_WRITE(dev, RK_CRYPTO_CTRL, RK_CRYPTO_BLOCK_START |
 		     _SBF(RK_CRYPTO_BLOCK_START, 16));
 }
 
-static int rk_set_data_start(struct rk_crypto_info *dev)
+static int rk_cipher_run(struct crypto_engine *engine, void *async_req)
 {
-	int err;
-	struct skcipher_request *req =
-		skcipher_request_cast(dev->async_req);
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct rk_cipher_rctx *rctx = skcipher_request_ctx(req);
+	struct skcipher_request *areq = container_of(async_req, struct skcipher_request, base);
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
 	struct rk_cipher_ctx *ctx = crypto_skcipher_ctx(tfm);
-	u32 ivsize = crypto_skcipher_ivsize(tfm);
-	u8 *src_last_blk = page_address(sg_page(dev->sg_src)) +
-		dev->sg_src->offset + dev->sg_src->length - ivsize;
-
-	/* Store the iv that need to be updated in chain mode.
-	 * And update the IV buffer to contain the next IV for decryption mode.
-	 */
-	if (rctx->mode & RK_CRYPTO_DEC) {
-		memcpy(ctx->iv, src_last_blk, ivsize);
-		sg_pcopy_to_buffer(dev->first, dev->src_nents, req->iv,
-				   ivsize, dev->total - ivsize);
-	}
-
-	err = dev->load_data(dev, dev->sg_src, dev->sg_dst);
-	if (!err)
-		crypto_dma_start(dev);
-	return err;
-}
-
-static int rk_ablk_start(struct rk_crypto_info *dev)
-{
-	struct skcipher_request *req =
-		skcipher_request_cast(dev->async_req);
-	unsigned long flags;
+	struct rk_cipher_rctx *rctx = skcipher_request_ctx(areq);
+	struct scatterlist *sgs, *sgd;
 	int err = 0;
+	int ivsize = crypto_skcipher_ivsize(tfm);
+	int offset;
+	u8 iv[AES_BLOCK_SIZE];
+	u8 biv[AES_BLOCK_SIZE];
+	u8 *ivtouse = areq->iv;
+	unsigned int len = areq->cryptlen;
+	unsigned int todo;
+
+	ivsize = crypto_skcipher_ivsize(tfm);
+	if (areq->iv && crypto_skcipher_ivsize(tfm) > 0) {
+		if (rctx->mode & RK_CRYPTO_DEC) {
+			offset = areq->cryptlen - ivsize;
+			scatterwalk_map_and_copy(rctx->backup_iv, areq->src,
+						 offset, ivsize, 0);
+		}
+	}
 
-	dev->left_bytes = req->cryptlen;
-	dev->total = req->cryptlen;
-	dev->sg_src = req->src;
-	dev->first = req->src;
-	dev->src_nents = sg_nents(req->src);
-	dev->sg_dst = req->dst;
-	dev->dst_nents = sg_nents(req->dst);
-
-	spin_lock_irqsave(&dev->lock, flags);
-	rk_ablk_hw_init(dev);
-	err = rk_set_data_start(dev);
-	spin_unlock_irqrestore(&dev->lock, flags);
-	return err;
-}
-
-static void rk_iv_copyback(struct rk_crypto_info *dev)
-{
-	struct skcipher_request *req =
-		skcipher_request_cast(dev->async_req);
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct rk_cipher_rctx *rctx = skcipher_request_ctx(req);
-	struct rk_cipher_ctx *ctx = crypto_skcipher_ctx(tfm);
-	u32 ivsize = crypto_skcipher_ivsize(tfm);
+	sgs = areq->src;
+	sgd = areq->dst;
 
-	/* Update the IV buffer to contain the next IV for encryption mode. */
-	if (!(rctx->mode & RK_CRYPTO_DEC)) {
-		memcpy(req->iv,
-		       sg_virt(dev->sg_dst) + dev->sg_dst->length - ivsize,
-		       ivsize);
+	while (sgs && sgd && len) {
+		if (!sgs->length) {
+			sgs = sg_next(sgs);
+			sgd = sg_next(sgd);
+			continue;
+		}
+		if (rctx->mode & RK_CRYPTO_DEC) {
+			/* we backup last block of source to be used as IV at next step */
+			offset = sgs->length - ivsize;
+			scatterwalk_map_and_copy(biv, sgs, offset, ivsize, 0);
+		}
+		if (sgs == sgd) {
+			err = dma_map_sg(ctx->dev->dev, sgs, 1, DMA_BIDIRECTIONAL);
+			if (err <= 0) {
+				err = -EINVAL;
+				goto theend_iv;
+			}
+		} else {
+			err = dma_map_sg(ctx->dev->dev, sgs, 1, DMA_TO_DEVICE);
+			if (err <= 0) {
+				err = -EINVAL;
+				goto theend_iv;
+			}
+			err = dma_map_sg(ctx->dev->dev, sgd, 1, DMA_FROM_DEVICE);
+			if (err <= 0) {
+				err = -EINVAL;
+				goto theend_sgs;
+			}
+		}
+		err = 0;
+		rk_ablk_hw_init(ctx->dev, areq);
+		if (ivsize) {
+			if (ivsize == DES_BLOCK_SIZE)
+				memcpy_toio(ctx->dev->reg + RK_CRYPTO_TDES_IV_0, ivtouse, ivsize);
+			else
+				memcpy_toio(ctx->dev->reg + RK_CRYPTO_AES_IV_0, ivtouse, ivsize);
+		}
+		reinit_completion(&ctx->dev->complete);
+		ctx->dev->status = 0;
+
+		todo = min(sg_dma_len(sgs), len);
+		len -= todo;
+		crypto_dma_start(ctx->dev, sgs, sgd, todo / 4);
+		wait_for_completion_interruptible_timeout(&ctx->dev->complete,
+							  msecs_to_jiffies(2000));
+		if (!ctx->dev->status) {
+			dev_err(ctx->dev->dev, "DMA timeout\n");
+			err = -EFAULT;
+			goto theend;
+		}
+		if (sgs == sgd) {
+			dma_unmap_sg(ctx->dev->dev, sgs, 1, DMA_BIDIRECTIONAL);
+		} else {
+			dma_unmap_sg(ctx->dev->dev, sgs, 1, DMA_TO_DEVICE);
+			dma_unmap_sg(ctx->dev->dev, sgd, 1, DMA_FROM_DEVICE);
+		}
+		if (rctx->mode & RK_CRYPTO_DEC) {
+			memcpy(iv, biv, ivsize);
+			ivtouse = iv;
+		} else {
+			offset = sgd->length - ivsize;
+			scatterwalk_map_and_copy(iv, sgd, offset, ivsize, 0);
+			ivtouse = iv;
+		}
+		sgs = sg_next(sgs);
+		sgd = sg_next(sgd);
 	}
-}
-
-static void rk_update_iv(struct rk_crypto_info *dev)
-{
-	struct skcipher_request *req =
-		skcipher_request_cast(dev->async_req);
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct rk_cipher_rctx *rctx = skcipher_request_ctx(req);
-	struct rk_cipher_ctx *ctx = crypto_skcipher_ctx(tfm);
-	u32 ivsize = crypto_skcipher_ivsize(tfm);
-	u8 *new_iv = NULL;
 
-	if (rctx->mode & RK_CRYPTO_DEC) {
-		new_iv = ctx->iv;
-	} else {
-		new_iv = page_address(sg_page(dev->sg_dst)) +
-			 dev->sg_dst->offset + dev->sg_dst->length - ivsize;
+	if (areq->iv && ivsize > 0) {
+		offset = areq->cryptlen - ivsize;
+		if (rctx->mode & RK_CRYPTO_DEC) {
+			memcpy(areq->iv, rctx->backup_iv, ivsize);
+			memzero_explicit(rctx->backup_iv, ivsize);
+		} else {
+			scatterwalk_map_and_copy(areq->iv, areq->dst, offset,
+						 ivsize, 0);
+		}
 	}
 
-	if (ivsize == DES_BLOCK_SIZE)
-		memcpy_toio(dev->reg + RK_CRYPTO_TDES_IV_0, new_iv, ivsize);
-	else if (ivsize == AES_BLOCK_SIZE)
-		memcpy_toio(dev->reg + RK_CRYPTO_AES_IV_0, new_iv, ivsize);
-}
+theend:
+	local_bh_disable();
+	crypto_finalize_skcipher_request(engine, areq, err);
+	local_bh_enable();
+	return 0;
 
-/* return:
- *	true	some err was occurred
- *	fault	no err, continue
- */
-static int rk_ablk_rx(struct rk_crypto_info *dev)
-{
-	int err = 0;
-	struct skcipher_request *req =
-		skcipher_request_cast(dev->async_req);
-
-	dev->unload_data(dev);
-	if (dev->left_bytes) {
-		rk_update_iv(dev);
-		if (sg_is_last(dev->sg_src)) {
-			dev_err(dev->dev, "[%s:%d] Lack of data\n",
-					__func__, __LINE__);
-			err = -ENOMEM;
-			goto out_rx;
-		}
-		dev->sg_src = sg_next(dev->sg_src);
-		dev->sg_dst = sg_next(dev->sg_dst);
-		err = rk_set_data_start(dev);
+theend_sgs:
+	if (sgs == sgd) {
+		dma_unmap_sg(ctx->dev->dev, sgs, 1, DMA_BIDIRECTIONAL);
 	} else {
-		rk_iv_copyback(dev);
-		/* here show the calculation is over without any err */
-		dev->complete(dev->async_req, 0);
-		tasklet_schedule(&dev->queue_task);
+		dma_unmap_sg(ctx->dev->dev, sgs, 1, DMA_TO_DEVICE);
+		dma_unmap_sg(ctx->dev->dev, sgd, 1, DMA_FROM_DEVICE);
 	}
-out_rx:
+theend_iv:
 	return err;
 }
 
@@ -446,9 +443,6 @@ static int rk_ablk_init_tfm(struct crypto_skcipher *tfm)
 	algt = container_of(alg, struct rk_crypto_tmp, alg.skcipher);
 
 	ctx->dev = algt->dev;
-	ctx->dev->start = rk_ablk_start;
-	ctx->dev->update = rk_ablk_rx;
-	ctx->dev->complete = rk_crypto_complete;
 
 	ctx->fallback_tfm = crypto_alloc_skcipher(name, 0, CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(ctx->fallback_tfm)) {
@@ -460,6 +454,8 @@ static int rk_ablk_init_tfm(struct crypto_skcipher *tfm)
 	tfm->reqsize = sizeof(struct rk_cipher_rctx) +
 		crypto_skcipher_reqsize(ctx->fallback_tfm);
 
+	ctx->enginectx.op.do_one_request = rk_cipher_run;
+
 	return 0;
 }
 
-- 
2.35.1

