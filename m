Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4169E774D34
	for <lists+linux-clk@lfdr.de>; Tue,  8 Aug 2023 23:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbjHHVnD (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 8 Aug 2023 17:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbjHHVnB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 17:43:01 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29DBE171A1
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 09:45:30 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99bc9e3cbf1so9076566b.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691513124; x=1692117924;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TelxLRsRRinTgbp1Mx+xtir/QVUAD4LrxMkZFMN8EHI=;
        b=naVRzRlO3d/YzPpedUZt3OEDAZxD5Xkav5ebXOcKRksnr8TTcKl1QpkJv0dBU5ylNX
         KNzXV7KEglFProqQuTJ9ImYcsuRHKSWElk3Bf5qDQ99Lcbq+hrT02lWGJkLF8U9ec7cW
         KDArW3QCyzi8TmvrT5tyYAHRgpletYeA2CQ+elTWuaA5ASvl6bS8VD6o0RfkilDl+R61
         P011nZMWI4p+x369ZJN8oUDGSdQci+XyDAR1NQJpd5foaDE6w5eoxZUchDqOF3rzePLV
         4TUSey5NVIgmoen9+wQBJPi94A6le3lwhDzTrdkpdSDie+sB4WPgLWsRhdKztVv5se1K
         IleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691513124; x=1692117924;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TelxLRsRRinTgbp1Mx+xtir/QVUAD4LrxMkZFMN8EHI=;
        b=mCCFZhiOfr2OLaspBLxdcaLdufkECdT4OJKUzNW4TsbwKtvrNuZZCO327pQnIePSY9
         lNHG5yggbFr1n9mo/SoUw+s5xDib5TvDhd2ozsQb8AS7nX8HzjxR98fI7KvGIme8D+x4
         s1iIH19drP4pba52xfsuZtfKE30wID2SYYRqVPqkQEdzeS6y8oOLRXNrNw66whMYA0zD
         h66VVukNv0VjAgDN+H+FSZTnT1Esww4se6EvC6APvvj+TrUQtRyDzqfq5rTFk7pSUuwH
         JAqNZuWtofL5iZ9nstIZ6dfKlRzP/mKfl7sxZZnY2Hq8oUw+o5mIawu9PxQIsiF8Nsb4
         SPdQ==
X-Gm-Message-State: AOJu0YyyQMblB4oj+1G3n+uJMyG2z5mHV4VBpczxUm/8+7uVxiNrHYox
        TA5k98ALSNyuDBb7Ikbu5PHGv0MWN+SQKtmz/0c7wBSp
X-Google-Smtp-Source: AGHT+IGMNq59xXInECgJsJ33KIL/qn/BCRKMgiROzC+TfyHmIpEsuNYzRJJJT3GT/iXlJU/N6Ortb9eHx+IqcQk3UhM=
X-Received: by 2002:a05:6402:387:b0:522:2b23:b5ea with SMTP id
 o7-20020a056402038700b005222b23b5eamr10813107edv.9.1691499679188; Tue, 08 Aug
 2023 06:01:19 -0700 (PDT)
MIME-Version: 1.0
Reply-To: kelly742825@gmail.com
Sender: credodokunor@gmail.com
Received: by 2002:a05:7412:c70b:b0:df:4a38:2aac with HTTP; Tue, 8 Aug 2023
 06:01:18 -0700 (PDT)
From:   kelly watson <kelly742825@gmail.com>
Date:   Tue, 8 Aug 2023 06:01:18 -0700
X-Google-Sender-Auth: ONZwE5FOLkQ1CuzieSRIs2ZcwcU
Message-ID: <CAMZk2G-1MNpsZsMtS1hEzYDXBk5qxGRA6LeQA+Ubx70YZWDiEg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_50,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

HALLO, HEB JE MIJN BERICHTEN GEZIEN!?
