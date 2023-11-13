Return-Path: <linux-clk+bounces-178-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4F17EA6F1
	for <lists+linux-clk@lfdr.de>; Tue, 14 Nov 2023 00:23:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2CBFB20A4A
	for <lists+linux-clk@lfdr.de>; Mon, 13 Nov 2023 23:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B361C3D989;
	Mon, 13 Nov 2023 23:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-clk@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD2524A14;
	Mon, 13 Nov 2023 23:22:54 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04DC8C5;
	Mon, 13 Nov 2023 15:22:53 -0800 (PST)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3b2ec9a79bdso3416942b6e.3;
        Mon, 13 Nov 2023 15:22:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699917772; x=1700522572;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KXcL97M2PMfWlzmjkDxdbFO/ZAhFUdOxEbJqoSct5Tk=;
        b=bvi40orQKXdxeV6dH4teDgYAZUbuo/q0hGMz+qfwKcNGnDn6/hzRz/PmBCTLljONpc
         Lj9ScQMDH3nS3BXKkqa5kW1/Rf3smY2zsakwJeSsFKccaBRbc/QTS4kyHCeJ5oP4GZ/f
         ZXHRpudgpoqC0Jc7lssoBl3MM5uKR5VUEdvGxPsFuPc/yQXLnsGzeTyLeJ5BBWR2AzYD
         xyAiuzDOaV3299uVoTS0cuN0NBLHdolnfi2aP751XGfKCS97F13L68yjZK3XCrkloaCG
         m9cE3TwVEIH2sjCIRusNwFog0R2FbaABaJtIz4mCF2mTUajtlmzxKrLhZBG85kFVURcX
         PN6g==
X-Gm-Message-State: AOJu0Ywh+c4/bTNOEOKc2jXs8BsVjhjSR2YwR+vU8ETF5AW37IeTVBSZ
	C7HpFhE309fs2l2JLeXW3g==
X-Google-Smtp-Source: AGHT+IGlXkQYdT9XhConqZT2NSxmZgbwzACO24pvQVBVdxJsyVzbVIViminAyZ2DMyM4K/MElI1rvg==
X-Received: by 2002:a05:6808:ece:b0:3b5:6432:e0eb with SMTP id q14-20020a0568080ece00b003b56432e0ebmr11884418oiv.38.1699917772257;
        Mon, 13 Nov 2023 15:22:52 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w19-20020a056808091300b003a747ea96a8sm956613oih.43.2023.11.13.15.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 15:22:51 -0800 (PST)
Received: (nullmailer pid 14741 invoked by uid 1000);
	Mon, 13 Nov 2023 23:22:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jianhui Zhao <zhaojh329@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Paolo Abeni <pabeni@redhat.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Johnson Wang <johnson.wang@mediatek.com>, linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Edward-JW Yang <edward-jw.yang@mediatek.com>, 
	Stephen Boyd <sboyd@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, "Garmin.Chang" <Garmin.Chang@mediatek.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	Sam Shih <sam.shih@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>
In-Reply-To: <42c9447ae32be8aaeca2047a5e97660fb67dd286.1699909748.git.daniel@makrotopia.org>
References: <cde7269e5975907ed2b7799328ea814e529ecf51.1699909748.git.daniel@makrotopia.org>
 <42c9447ae32be8aaeca2047a5e97660fb67dd286.1699909748.git.daniel@makrotopia.org>
Message-Id: <169991777049.14724.13556943216352614509.robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: clock: mediatek: add clock
 controllers of MT7988
Date: Mon, 13 Nov 2023 17:22:50 -0600


On Mon, 13 Nov 2023 21:12:19 +0000, Daniel Golle wrote:
> Add various clock controllers found in the MT7988 SoC to existing
> bindings (if applicable) and add files for the new ethwarp, mcusys
> and xfi-pll clock controllers not previously present in any previous
> MediaTek SoC.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../bindings/arm/mediatek/mediatek,ethsys.txt |  1 +
>  .../arm/mediatek/mediatek,infracfg.yaml       |  1 +
>  .../arm/mediatek/mediatek,mt7988-ethwarp.yaml | 60 +++++++++++++++++++
>  .../arm/mediatek/mediatek,mt7988-mcusys.yaml  | 46 ++++++++++++++
>  .../arm/mediatek/mediatek,mt7988-xfi-pll.yaml | 49 +++++++++++++++
>  .../bindings/clock/mediatek,apmixedsys.yaml   |  1 +
>  .../bindings/clock/mediatek,topckgen.yaml     |  1 +
>  .../bindings/net/pcs/mediatek,sgmiisys.yaml   |  2 +
>  8 files changed, 161 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7988-ethwarp.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7988-mcusys.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7988-xfi-pll.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7988-ethwarp.example.dtb: /example-0/soc/clock-controller@15031000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/42c9447ae32be8aaeca2047a5e97660fb67dd286.1699909748.git.daniel@makrotopia.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


