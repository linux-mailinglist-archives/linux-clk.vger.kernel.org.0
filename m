Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 448A972B9C3
	for <lists+linux-clk@lfdr.de>; Mon, 12 Jun 2023 10:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbjFLIGq (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 12 Jun 2023 04:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234127AbjFLIGZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 04:06:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02C8115
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686557058;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4o6iBs/cGUwezMGSZngT4KvoAhZmnl7dmMW6aK8mMXs=;
        b=JEM5WGvO/vYynQ5dl/5eXYin6p0s8pvXlpJ1wtTawTOCg5kZJnwV9rej74B+AsOsyGAwyw
        YneN86CyjrnKWRYnzkPjRQ/RoJQQWv5VBXWGtEZe/XAR/F+oiW2ku6f/JFZyZVQHUsC6oC
        ExHH0uiBh343dwYQbnqIA6+9iDS0mbI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-gaMfysVBNBO0Fd9NzPr4dw-1; Mon, 12 Jun 2023 03:25:16 -0400
X-MC-Unique: gaMfysVBNBO0Fd9NzPr4dw-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-74faf5008bbso86265685a.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 00:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686554716; x=1689146716;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4o6iBs/cGUwezMGSZngT4KvoAhZmnl7dmMW6aK8mMXs=;
        b=l/CTl3k9+5W1bdr9Byi4h7znSUU4ps8wkXcmuaeGaXDzEOpE6yzJgVNmmATFiEbxz8
         Mt0eP+oP8wl/W+SWV3mgSsuQjKS5HlSBOvp9/IUHOrnBRCpONmfXnSkITtgeJ6F9Ucjr
         PM2/noAns49znYcp0dmFH7ltJqw2KrTCZjWNXVWRoR34C3L+nXEy0jTKlX6uLqucsr1y
         MKynBHUfa6CPYWDhgcIJT075Nq103M/Lvh7yowS6cxgqw+O+GzHsiekce4uNfMxT5Wf3
         3Xs0+pDE357RzDvl+NknI0mm6B8fH5Anpzsd4SuuMkQnMdcNK25h2Fz4yOYjpTaB0TxG
         6KSA==
X-Gm-Message-State: AC+VfDwixwzRqHXMbBFFpUusnmSL4I4BKNWtDg+cW4mN7EYH3bUDv+Jm
        zZJpP5xzHPn7DqzVRGqaPXdHRcoIfwwbDj6hgaytuHUWFmT14AVL0AlzkkqsNu3QaYGiz0zcQ3c
        zrCfHoK49YsfgyHRjNDNE
X-Received: by 2002:a05:620a:261b:b0:75d:53ee:ced2 with SMTP id z27-20020a05620a261b00b0075d53eeced2mr9737742qko.3.1686554715871;
        Mon, 12 Jun 2023 00:25:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5VuifOapEch7jQlR/qS70uakqBc0QmL94RvL3OjCGbDQ+rEyQGny14ZUgrn99WU43OqLM/LQ==
X-Received: by 2002:a05:620a:261b:b0:75d:53ee:ced2 with SMTP id z27-20020a05620a261b00b0075d53eeced2mr9737716qko.3.1686554715595;
        Mon, 12 Jun 2023 00:25:15 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-250-244.dyn.eolo.it. [146.241.250.244])
        by smtp.gmail.com with ESMTPSA id v11-20020ae9e30b000000b0074fb15e2319sm2685635qkf.122.2023.06.12.00.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 00:25:15 -0700 (PDT)
Message-ID: <38dad5cb196741e56d018cea155982928694b2cc.camel@redhat.com>
Subject: Re: [RFC PATCH v8 03/10] dpll: core: Add DPLL framework base
 functions
From:   Paolo Abeni <pabeni@redhat.com>
To:     Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     kuba@kernel.org, vadfed@meta.com, jonathan.lemon@gmail.com,
        corbet@lwn.net, davem@davemloft.net, edumazet@google.com,
        vadfed@fb.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, saeedm@nvidia.com, leon@kernel.org,
        richardcochran@gmail.com, sj@kernel.org, javierm@redhat.com,
        ricardo.canuelo@collabora.com, mst@redhat.com, tzimmermann@suse.de,
        michal.michalik@intel.com, gregkh@linuxfoundation.org,
        jacek.lawrynowicz@linux.intel.com, airlied@redhat.com,
        ogabbay@kernel.org, arnd@arndb.de, nipun.gupta@amd.com,
        axboe@kernel.dk, linux@zary.sk, masahiroy@kernel.org,
        benjamin.tissoires@redhat.com, geert+renesas@glider.be,
        milena.olech@intel.com, kuniyu@amazon.com, liuhangbin@gmail.com,
        hkallweit1@gmail.com, andy.ren@getcruise.com, razor@blackwall.org,
        idosch@nvidia.com, lucien.xin@gmail.com, nicolas.dichtel@6wind.com,
        phil@nwl.cc, claudiajkang@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, linux-clk@vger.kernel.org,
        vadim.fedorenko@linux.dev
Date:   Mon, 12 Jun 2023 09:25:06 +0200
In-Reply-To: <ZIWVuPMyKRPv6oyh@nanopsycho>
References: <20230609121853.3607724-1-arkadiusz.kubalewski@intel.com>
         <20230609121853.3607724-4-arkadiusz.kubalewski@intel.com>
         <ZIWVuPMyKRPv6oyh@nanopsycho>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 2023-06-11 at 11:36 +0200, Jiri Pirko wrote:
> Fri, Jun 09, 2023 at 02:18:46PM CEST, arkadiusz.kubalewski@intel.com wrot=
e:
> > From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>=20
> [...]
>=20
> > +int dpll_device_register(struct dpll_device *dpll, enum dpll_type type=
,
> > +			 const struct dpll_device_ops *ops, void *priv)
> > +{
> > +	struct dpll_device_registration *reg;
> > +	bool first_registration =3D false;
> > +
> > +	if (WARN_ON(!ops))
> > +		return -EINVAL;
> > +	if (WARN_ON(type < DPLL_TYPE_PPS || type > DPLL_TYPE_MAX))
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&dpll_lock);
> > +	reg =3D dpll_device_registration_find(dpll, ops, priv);
> > +	if (reg) {
> > +		mutex_unlock(&dpll_lock);
> > +		return -EEXIST;
> > +	}
> > +
> > +	reg =3D kzalloc(sizeof(*reg), GFP_KERNEL);
> > +	if (!reg) {
> > +		mutex_unlock(&dpll_lock);
> > +		return -EEXIST;
> > +	}
> > +	reg->ops =3D ops;
> > +	reg->priv =3D priv;
> > +	dpll->type =3D type;
> > +	first_registration =3D list_empty(&dpll->registration_list);
> > +	list_add_tail(&reg->list, &dpll->registration_list);
> > +	if (!first_registration) {
> > +		mutex_unlock(&dpll_lock);
> > +		return 0;
> > +	}
> > +
> > +	xa_set_mark(&dpll_device_xa, dpll->id, DPLL_REGISTERED);
> > +	mutex_unlock(&dpll_lock);
> > +	dpll_device_create_ntf(dpll);
>=20
> This function is introduced in the next patch. Breaks bissection. Make
> sure you can compile the code after every patch applied.

WRT, I think the easiest way to solve the above is adding the function
call in the next patch.

Cheers,

Paolo

