Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB1F4E3147
	for <lists+linux-clk@lfdr.de>; Mon, 21 Mar 2022 21:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353173AbiCUUKy (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 21 Mar 2022 16:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353098AbiCUUKT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Mar 2022 16:10:19 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20B418597D
        for <linux-clk@vger.kernel.org>; Mon, 21 Mar 2022 13:08:10 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id v22so8308868wra.2
        for <linux-clk@vger.kernel.org>; Mon, 21 Mar 2022 13:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7FqnmDcsvrgYbGP6OPh4RiTzDpGi2N0/p6IXPk696Vg=;
        b=cSv2fVbDJkMxVE7wCqRDiDoIM+o2oygSfZJi5Lo8JF+0nPoMSMuYGxZeV1grnEbf3Q
         8+FMdFK/NBM/b72tKOQxCvMWYAXOzbs3ZjEUJ/0PF7fFTAjLE1uwEmqOfceAbSzxy3rE
         NZyqn5dK91pZm47mnumvMLE9ou9PkiBM0gVyOiNfSqapxOHQW7nu1CzewxtMQ6LPTVTo
         4zO4nH7vJe04kqSNep/pTIgMSjc499naZ3dX0mHbD1noHXGaB6lA2tQVBBNLCZM5QN2D
         xOXR0qdJYolDSe4KrNDX94sylsi+Hkf5U2A6KiQC/ErJ2NDlF3kOa3Wpi5HraV7pn5O5
         t60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7FqnmDcsvrgYbGP6OPh4RiTzDpGi2N0/p6IXPk696Vg=;
        b=ThQPXlLsKPQz1dD530fs0L0nCFwDfEHje+NqDFT4PRTsF9oGwh2X57coAUUpGZTMMK
         OOicVyzWxwTDnVE/lgVb73o9ISeGiK0l59jUmNbCt1qQtOfAU78CViE1q6SgfT1KoHg/
         5csI05wakIPnOm/RGLdw3A2t+hV4Cd5Of+516cSCFMzlPTHLpgV7bQsl6Wuo10vWxaUl
         0jAJWUlc1bHU7MknYQVEunLyLsQ6ph4pZ0TyQOzyYRHw/Zr/4+6TjGHZDBvoelrYFgUf
         NOv4zL91XyQQEDbKdUrnG/4PkelPUHNiMch592MwG3dJYSC8jeNscgbw06E3si6Twtat
         8RYg==
X-Gm-Message-State: AOAM530FJPtgiXw/7FU18witqqhCUnPZRYirtqGa5BqiUXK8iLVNFUpP
        IidN0myti5UAU2zycHOJG9oedg==
X-Google-Smtp-Source: ABdhPJzWq4byShCgqQrYWFCe7oBReuZfefWI5AqTr4VVN54zmHM+SXxb+aSGKY0sN+bcl4fgvkgZsA==
X-Received: by 2002:a5d:6746:0:b0:203:d6c1:9c5b with SMTP id l6-20020a5d6746000000b00203d6c19c5bmr19648307wrw.446.1647893289203;
        Mon, 21 Mar 2022 13:08:09 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id i14-20020a0560001ace00b00203da1fa749sm24426988wry.72.2022.03.21.13.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 13:08:08 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     heiko@sntech.de, herbert@gondor.apana.org.au, krzk+dt@kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 25/26] crypto: rockchip: fix style issue
Date:   Mon, 21 Mar 2022 20:07:38 +0000
Message-Id: <20220321200739.3572792-26-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321200739.3572792-1-clabbe@baylibre.com>
References: <20220321200739.3572792-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch fixes some warning reported by checkpatch

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/rockchip/rk3288_crypto_ahash.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/rockchip/rk3288_crypto_ahash.c b/drivers/crypto/rockchip/rk3288_crypto_ahash.c
index 28f4a7124683..1d20f58275f0 100644
--- a/drivers/crypto/rockchip/rk3288_crypto_ahash.c
+++ b/drivers/crypto/rockchip/rk3288_crypto_ahash.c
@@ -345,7 +345,7 @@ static int rk_cra_hash_init(struct crypto_tfm *tfm)
 
 	/* for fallback */
 	tctx->fallback_tfm = crypto_alloc_ahash(alg_name, 0,
-					       CRYPTO_ALG_NEED_FALLBACK);
+						CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(tctx->fallback_tfm)) {
 		dev_err(tctx->dev->dev, "Could not load fallback driver.\n");
 		return PTR_ERR(tctx->fallback_tfm);
@@ -403,8 +403,8 @@ struct rk_crypto_tmp rk_ahash_sha1 = {
 				  .cra_init = rk_cra_hash_init,
 				  .cra_exit = rk_cra_hash_exit,
 				  .cra_module = THIS_MODULE,
-				  }
-			 }
+			}
+		}
 	}
 };
 
@@ -433,8 +433,8 @@ struct rk_crypto_tmp rk_ahash_sha256 = {
 				  .cra_init = rk_cra_hash_init,
 				  .cra_exit = rk_cra_hash_exit,
 				  .cra_module = THIS_MODULE,
-				  }
-			 }
+			}
+		}
 	}
 };
 
@@ -463,7 +463,7 @@ struct rk_crypto_tmp rk_ahash_md5 = {
 				  .cra_init = rk_cra_hash_init,
 				  .cra_exit = rk_cra_hash_exit,
 				  .cra_module = THIS_MODULE,
-				  }
 			}
+		}
 	}
 };
-- 
2.34.1

