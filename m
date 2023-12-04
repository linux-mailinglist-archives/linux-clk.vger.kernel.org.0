Return-Path: <linux-clk+bounces-808-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C761803685
	for <lists+linux-clk@lfdr.de>; Mon,  4 Dec 2023 15:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 688F01C20A55
	for <lists+linux-clk@lfdr.de>; Mon,  4 Dec 2023 14:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA8C28DAF;
	Mon,  4 Dec 2023 14:25:55 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B56642129;
	Mon,  4 Dec 2023 06:25:20 -0800 (PST)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-58e1ddc68b2so1737630eaf.2;
        Mon, 04 Dec 2023 06:25:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701699920; x=1702304720;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lhhmi8w8FhrDZiDw2dpqrrV8WQgs4nmlcgmnrIZW9vM=;
        b=RYBGE3x62o0/TbHadOb1SnzkaSgy2Sd+5iP4z2j1n2bb/yU8P5jRW8Ygd2oLKGFXl/
         C3hJ3kX40jllyM/pzhFyHN80C4UtujjUDZWWtqsEJzleXJDgb3e1c5IZzFSHNmU9Wm4S
         GG2WPkpg05UukWmU99Dmi1sRWyK4CgmX6/qCxJ0quCQdN5Larzv1ILSzrY1nW5jF4lxg
         L0sYW64varrZ+MTXk2ztIGkz1Cn2mNLup8N5Ed0PLgn/ruVeKfKVdzNTySB8dov4Gy8/
         SgThDidT8m30+vUAh4DxWRB+eVJWo/hv26KnXUOoySwwSXz6Pqg4j0tKyZefIPP70nes
         OB6Q==
X-Gm-Message-State: AOJu0YwOvxQEGHnokL/+QZhckH8s6q8F2WBVi5YUFJlVZzGspYBBmaUD
	jgdKHfZyLYpgTAGIdkt0Nw==
X-Google-Smtp-Source: AGHT+IHUIM+kCotvnxNhLlPOfisb9roK9l9+KaY7l/Gbx+B9GlChh+E50rzm8GoEQ40QIBw//sepKg==
X-Received: by 2002:a05:6820:a82:b0:58e:1c48:4953 with SMTP id de2-20020a0568200a8200b0058e1c484953mr2535013oob.13.1701699919830;
        Mon, 04 Dec 2023 06:25:19 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x16-20020a4a6210000000b00587aaf6add7sm1976179ooc.9.2023.12.04.06.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 06:25:19 -0800 (PST)
Received: (nullmailer pid 1225685 invoked by uid 1000);
	Mon, 04 Dec 2023 14:25:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: guoren@kernel.org, robh+dt@kernel.org, samuel.holland@sifive.com, jszhang@kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, richardcochran@gmail.com, paul.walmsley@sifive.com, conor@kernel.org, inochiama@outlook.com, linux-clk@vger.kernel.org, Chen Wang <unicorn_wang@outlook.com>, palmer@dabbelt.com, sboyd@kernel.org, krzysztof.kozlowski+dt@linaro.org, xiaoguang.xing@sophgo.com, devicetree@vger.kernel.org, chao.wei@sophgo.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com
In-Reply-To: <14616bce163d689a4e640ab7b372421ca8306a92.1701691923.git.unicorn_wang@outlook.com>
References: <cover.1701691923.git.unicorn_wang@outlook.com>
 <14616bce163d689a4e640ab7b372421ca8306a92.1701691923.git.unicorn_wang@outlook.com>
Message-Id: <170169991797.1225669.8378193409195638634.robh@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: sophgo: Add Sophgo system
 control module
Date: Mon, 04 Dec 2023 08:25:17 -0600


On Mon, 04 Dec 2023 20:54:53 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add documentation to describe Sophgo System Controller for SG2042.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../soc/sophgo/sophgo,sg2042-sysctrl.yaml     | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sysctrl.example.dtb: /example-0/system-controller@30010000: failed to match any schema with compatible: ['sophgo,sg2042-sysctl']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/14616bce163d689a4e640ab7b372421ca8306a92.1701691923.git.unicorn_wang@outlook.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


