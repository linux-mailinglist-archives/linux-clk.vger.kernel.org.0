Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6959B10E2
	for <lists+linux-clk@lfdr.de>; Thu, 12 Sep 2019 16:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732455AbfILOQG (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 12 Sep 2019 10:16:06 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39986 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732444AbfILOPm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Sep 2019 10:15:42 -0400
Received: by mail-wr1-f67.google.com with SMTP id l3so5920792wru.7
        for <linux-clk@vger.kernel.org>; Thu, 12 Sep 2019 07:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PBfT3mxgX+rD0lAyvtzYZMZFZtcbsSUwaCSVY0jK/V8=;
        b=SZNIb9+Gj9o3ah2gIfkl6oIdgZYqAZVtp23KLGveHqrOnNJzkhqhla52cvSzsRHd7j
         ZtzRW28j/osny8ID4m9lctcdlPwbylWBbyjXDK5Ax7Qsi9NNRG0vyfN6T4RTALd8OP6d
         8FGozzt1l5j/c4WaDBYTA1+A5JCDbweZ+4oj6ZW/Pnyxku9ZBHInY/JjD4k5DegrGeFo
         zJVH6eaeMsKR+3i8rIADhF6Ehl8yvLw89idDpLJiwTqbPKTTfvGOIGe9F6G4UMW9TX10
         jRraENoy2m9ExdecOsU/jSIn225lO+R2zapaUHPLRf7Wrywk83zv26DktFnHWccbI+lC
         IsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PBfT3mxgX+rD0lAyvtzYZMZFZtcbsSUwaCSVY0jK/V8=;
        b=jAzsoCOwzNhuWUZ7MW7yNhQvDHv+4h+PQqlMpwwyruIMKM+qDXkBIW0Q35TTnNaZVJ
         b931+zE1gXjG+wh24lVAcTFdb52UxzVKtzM3dmPQY13x3OM6gQPKMIL61jx14TfCyCMl
         +Id862/mnNwaVDh+OoZCKOXZZZDeMtgquoO1sPoOX42Od/KSExbWnz2Sb6gGZaT+ENdD
         4sWb0OBFFZKLgCKr8oGNGMSMM893dFONPGFR5TYJOYnYv3TAdqIvfUa0aNHUHaQXzk6z
         ynL0XS1cGb1Rh99Os+5fE0srvCkoYsk3u3LOSnvmVcWQ2xdxduL52fK7vD5oo9mXG+/8
         CfFQ==
X-Gm-Message-State: APjAAAV9ioB5IhvjAfku3DicwRMkdyGO4suGZCNqZcN8OALDVxdufXhu
        j1ZYpLi5/PURxqUiedEjvdr3Gw==
X-Google-Smtp-Source: APXvYqwmScopqV21yxQR5oM3O6jHJFfw901TYP57XVjX/n1COgdd1lAJ8vCwY/XQG2an4RNcpVQruw==
X-Received: by 2002:a5d:4649:: with SMTP id j9mr34265501wrs.193.1568297740484;
        Thu, 12 Sep 2019 07:15:40 -0700 (PDT)
Received: from localhost.localdomain (69.red-83-35-113.dynamicip.rima-tde.net. [83.35.113.69])
        by smtp.gmail.com with ESMTPSA id p23sm137599wma.18.2019.09.12.07.15.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 12 Sep 2019 07:15:39 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        agross@kernel.org, mturquette@baylibre.com,
        bjorn.andersson@linaro.org
Cc:     niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Clock changes to support cpufreq on QCS404 
Date:   Thu, 12 Sep 2019 16:15:29 +0200
Message-Id: <20190912141534.28870-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following clock changes are required to enable cpufreq support on
the QCS404

v2: sboyd review of v1
    -------------------
    missing cover letter
    reorder the patchset
    use clk_parent data to speficy the parent clock
    dong ignore the clock position abi

Jorge Ramirez-Ortiz (5):
  clk: qcom: gcc: limit GPLL0_AO_OUT operating frequency
  clk: qcom: hfpll: register as clock provider
  clk: qcom: hfpll: CLK_IGNORE_UNUSED
  clk: qcom: hfpll: use clk_parent_data to specify the parent
  clk: qcom: apcs-msm8916: get parent clock names from DT

 drivers/clk/qcom/apcs-msm8916.c  | 15 ++++++++++++---
 drivers/clk/qcom/clk-alpha-pll.c |  8 ++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  1 +
 drivers/clk/qcom/gcc-qcs404.c    |  2 +-
 drivers/clk/qcom/hfpll.c         | 21 +++++++++++++++++++--
 5 files changed, 41 insertions(+), 6 deletions(-)

-- 
2.23.0

