Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4671030F70F
	for <lists+linux-clk@lfdr.de>; Thu,  4 Feb 2021 17:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237257AbhBDPdB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 4 Feb 2021 10:33:01 -0500
Received: from mail-oo1-f52.google.com ([209.85.161.52]:40763 "EHLO
        mail-oo1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237255AbhBDPVs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Feb 2021 10:21:48 -0500
Received: by mail-oo1-f52.google.com with SMTP id d3so832202ool.7;
        Thu, 04 Feb 2021 07:21:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=T/w3UsXs5CpLGbmrcFDWBtdDM8zstN972mWNd93eBiA=;
        b=CuVabGrsJ3micNP+mv6Kbp7DZ5a/skHlLe7yoFPejoOJZkr7ZIBKs+okaozqn+XyUz
         Yd6vACEVP+u9mQAyDztp2kRc26BAIStwS1Fi3to7amv8z02j1HSJUZjb+TOnWEHDkYA4
         0FZc1ty57ehXcZWGW2nkZu/6QeEjTAv5Lm+TprqF2oV5EF2q5dDPpt7jjMh/Fm5WavFQ
         mez8RIbLA9qeSFvTKiFxnr40MBTpVJ92rdIQgK19TJu5uLeQ5LVkM+4TWlc+ja2QsyWM
         UnH2qUeLj5rzequ24sgLAg+531OO2epECsA7du3723fj93DSWI5pi6GObc9TYm9E5u9j
         fIVg==
X-Gm-Message-State: AOAM531i5AA/Inn7c8s4P3CxRmayIWlQP4vmna2TNUdHIBcBNdd44Ru9
        J2j/OGw6Y62aWYvNBqqRN0pp0wZorg==
X-Google-Smtp-Source: ABdhPJz4BR3qX/jeBDQvEtIUDmfz1nIT1DEUIWsG2rluhKtoac9X2XNuMRYb0+rMeeEuMxQeN6KuQA==
X-Received: by 2002:a4a:9e55:: with SMTP id w21mr6010393ook.67.1612452067897;
        Thu, 04 Feb 2021 07:21:07 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g13sm869623otj.67.2021.02.04.07.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:21:07 -0800 (PST)
Received: (nullmailer pid 452044 invoked by uid 1000);
        Thu, 04 Feb 2021 15:20:57 -0000
From:   Rob Herring <robh@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     shubhrajyoti.datta@gmail.com, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org, git-dev@xilinx.com,
        linux-clk@vger.kernel.org, sboyd@kernel.org
In-Reply-To: <1612446810-6113-2-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1612446810-6113-1-git-send-email-shubhrajyoti.datta@xilinx.com> <1612446810-6113-2-git-send-email-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH v8 1/7] dt-bindings: add documentation of xilinx clocking wizard
Date:   Thu, 04 Feb 2021 09:20:57 -0600
Message-Id: <1612452057.740171.452043.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 04 Feb 2021 19:23:24 +0530, Shubhrajyoti Datta wrote:
> Add the devicetree binding for the xilinx clocking wizard.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v6:
> Fix a yaml warning
> v7:
> Add vendor prefix speed-grade
> v8:
> Fix the warnings
> 
>  .../bindings/clock/xlnx,clocking-wizard.yaml       | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.example.dt.yaml: clock-generator@40040000: 'speed-grade' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.example.dt.yaml: clock-generator@40040000: 'clock-output-names', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml

See https://patchwork.ozlabs.org/patch/1436021

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

