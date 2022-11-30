Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0740F63D64B
	for <lists+linux-clk@lfdr.de>; Wed, 30 Nov 2022 14:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235451AbiK3NKH (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 30 Nov 2022 08:10:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbiK3NKG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Nov 2022 08:10:06 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F6376C709
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 05:10:05 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id j4so26903074lfk.0
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 05:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QSDJw0ODIzxJ3Q5ZOD+op6dLWUGJzSvvPSRrl92Cs5w=;
        b=v2m+nimcCsOLmx5fnQUbfHDqaIhtqOX5rfCh5e+nPTeh6bzbolckVlLz6KJvQALo22
         eP/zByYGO8M+UKRiP0Bt3LkIc9wFTy2sIxrKg4XULEMgHeI+vMx2bEJPAolLxkFGhzux
         EI17BYuGU1y3G3kyVNbb4m1EKFM+I+Y62wArNsgFpwb1sQ2XHwqrtP8tbADe0A33Cc+j
         jW6NEV84A8zRo56eAtjYGK/0b/Ekk2PO67TuLHLhvtJNELnuYHzG0bi8/dPo/lPGr/ZT
         KYvaumHX614aQZD3+p0WX1lpPQ1fjO6B2rT+IUJyAjJzz3y1X0GzGoEoe7ZSCAZymewl
         zTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSDJw0ODIzxJ3Q5ZOD+op6dLWUGJzSvvPSRrl92Cs5w=;
        b=JsGdJNzuPtlpHBmqXQE5lcTLHfU2pcyOWMD5JdMKWAn708J2wU/HVrH6N4nsG+qfRY
         PL3VWHw7UE8M2lHLZLJnYJv3vMqil9s9ydEGY69RGuVQkDlS6CII7bDM2FBGD1g+ESrR
         D45wUBNhz/gKzjszbLr7KpH9gqTTi/X8ZDWgpDK5ZiZzVcPiFb2y6poTY72AIM18k2PK
         Fr//Ry/+QnhUWf0sxaTAU84puOqSq7opiETfD+8H28WuNRbJc9eko4HRtcBEkPBXpl3s
         bIG9K159t6evvjqwmGdoHbwNMlK0/5BZxixdBNOQUK2cic4wckNpj3Wqi31a1hxr0IBd
         G1kQ==
X-Gm-Message-State: ANoB5pntUAL8RQGsa/exx67THsPGUseVWVaPfFA6DfDFxepLmXM8ZEa4
        Bn8SQ2sr8aj7R0UvDwi9UHB/IQ==
X-Google-Smtp-Source: AA0mqf7IaDh9Ghu+7+X7o6HLVG1jZjG+Ms6pCk0KMqaEBNd72LcMiMCJ+S3Jp1YZ8kD8w7PHKTr12g==
X-Received: by 2002:a05:6512:2385:b0:4ab:13d7:5751 with SMTP id c5-20020a056512238500b004ab13d75751mr21253922lfv.631.1669813803454;
        Wed, 30 Nov 2022 05:10:03 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id p9-20020ac246c9000000b004b01305732bsm250083lfo.216.2022.11.30.05.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 05:10:02 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v2 0/8] clk: qcom: rpm/rpmh: drop platform names
Date:   Wed, 30 Nov 2022 15:09:53 +0200
Message-Id: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Both RPM and RPMH clocks use platform (SoC) as a part of the clock
definition. However there is nothing really SoC-specific in this
part. Using it just leads to confusion and sometimes to duplication of
definitions. Drop the SoC name where it is logical.

Note: the smd-rpm clocks also suffer from the same issue a bit, there
are platform-specific and platform-independent clocks. Corresponding
patches will be sent later if this approach is accepted.

Changes since v1:
- Reworked and split the Soc-name removal patch for RPMH clocks

Dmitry Baryshkov (8):
  clk: qcom: rpmh: group clock definitions together
  clk: qcom: rpmh: reuse common duplicate clocks
  clk: qcom: rpmh: drop all _ao names
  clk: qcom: rpmh: remove platform names from BCM clocks
  clk: qcom: rpmh: rename ARC clock data
  clk: qcom: rpmh: rename VRM clock data
  clk: qcom: rpmh: remove the last traces of the platform usage
  clk: qcom: rpm: drop the platform from clock definitions

 drivers/clk/qcom/clk-rpm.c  | 194 ++++++++---------
 drivers/clk/qcom/clk-rpmh.c | 421 ++++++++++++++++++------------------
 2 files changed, 294 insertions(+), 321 deletions(-)

-- 
2.35.1

